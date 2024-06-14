
# --------------------------------
# Prompt functions
calculate_execution_time() {
    if [ $JOB_EXECUTION_STARTED ]; then
    local _NOW=$(date +%s%3N)
    local _MILISECS=$(($_NOW-$JOB_EXECUTION_STARTED))
    local _SECS=$((_MILISECS / 1000))
    local JOB_MILISECS=$((_MILISECS % 1000))
    local JOB_SECS=$((_SECS % 60))
    local JOB_MINS=$(((d_s / 60) % 60))
    local JOB_HOURS=$((d_s / 3600))

    if [[ $_MILISECS -lt 1000 ]]; then
        JOB_EXECUTION_CLASS_TIME="%F{green}(fast) "
    elif [[ $_MILISECS -ge 1000 && $_MILISECS -lt 10000 ]]; then
        JOB_EXECUTION_CLASS_TIME="%F{yellow}(ok) "
    elif [[ $_MILISECS -ge 10000 ]]; then
        JOB_EXECUTION_CLASS_TIME="%F{red}(slow) "
    fi

    if [[ $JOB_HOURS -gt 0 ]]; then 
        JOB_EXECUTION_TIME="${JOB_HOURS} hrs ${JOB_MINS} mins"
    elif [[ $JOB_MINS -gt 0 ]]; then 
        JOB_EXECUTION_TIME="${JOB_MINS} mins ${JOB_SECS} secs"
    elif [[ $JOB_SECS -ge 10 ]]; then 
        JOB_EXECUTION_TIME="${JOB_SECS}.$((JOB_MILISECS / 100)) secs"
    elif [[ $JOB_SECS -gt 0 ]]; then 
        JOB_EXECUTION_TIME="${JOB_SECS}.$((JOB_MILISECS / 10)) secs"
    else 
        JOB_EXECUTION_TIME="${JOB_MILISECS} milisecs"
    fi

    export RPROMPT_JOB_EXECUTION_TIME="${JOB_EXECUTION_CLASS_TIME}${PROMPT_EXECTIME_ICON}${JOB_EXECUTION_TIME}${PROMPT_RESET}"
    unset JOB_EXECUTION_STARTED
  fi
}

prep_git_prompt() {
    local branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch_name" ]; then
        local repo_name=$(basename `git rev-parse --show-toplevel`)
        local git_user=$(git config user.name)
        
        if [ "$(git status --short | wc -l | tr -d ' ')" -gt 0 ]; then
            branch_status="${PROMPT_SEP_ICON} ${PROMPT_GIT_COMMIT_DIRTY}${PROMPT_GIT_COMMIT_ICON}[dirty]"
        else
            branch_status="${PROMPT_SEP_ICON} ${PROMPT_GIT_COMMIT_CLEAN}${PROMPT_GIT_COMMIT_ICON}[clean]"
        fi

        export PROMPT_GIT_DETAILS="${PROMPT_SEP_ICON} ${PROMPT_GIT}${PROMPT_GIT_ICON}gh@$git_user ${PROMPT_ICON} $repo_name/$branch_name ${branch_status}"
    else
        export PROMPT_GIT_DETAILS="${PROMPT_SEP_ICON} ${PROMPT_ERR}no git repo found"
    fi
}

preexec() {
  # calculate_execution_time
  JOB_EXECUTION_STARTED=$(date +%s%3N)
}

precmd() {
  calculate_execution_time
  prep_git_prompt
}

# --------------------------------
# Additional functions
mkcd() {
    mkdir -v -p "$1" && cd "$1"
}

proc_find() {
    ps aux | grep "$1"
}

sys_upgrade() {
    sudo apt update && sudo apt upgrade
}

sys_cleanup() {
    sudo apt autoremove && sudo apt autoclean
}

sh_script() {
    local script_name=$1
    touch "$script_name"
    echo "#!/bin/zsh" > "$script_name"
    chmod +x "$script_name"
    $EDITOR "$script_name"
}

file_find() {
    find . -type f -iname "*$1*"
}

dir_find() {
    find . -type d -iname "*$1*"
}

extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar -xvjf "$1"     ;;
            *.tar.gz)    tar -xvzf "$1"     ;;
            *.tar.xz)    tar -vxf "$1"     ;;
            *.bz2)       bzip2 -dv "$1"      ;;
            *.rar)       unrar x -v "$1"      ;;
            *.gz)        gzip -dv "$1"       ;;
            *.tar)       tar -xvf "$1"      ;;
            *.tbz2)      tar -xvjf "$1"     ;;
            *.tgz)       tar -xvzf "$1"     ;;
            *.zip)       unzip -v "$1"        ;;
            *.Z)         uncompress -v "$1"   ;;
            *)           echo "Unsupported archive format: $1" ;;
        esac
    else
        echo "$1 is not a valid file"
    fi
}

genpass() {
    < /dev/urandom tr -dc A-Z-a-z-0-9 | head -c"${1:-$1}"
    echo
}

search_for() {
    grep -rnw '.' -e "$1" # --color=auto
}
