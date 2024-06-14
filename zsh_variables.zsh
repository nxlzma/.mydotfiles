

# Exporting variables
export JAVA_HOME="/usr/local/graalvm"
export PATH="$HOME/.local/bin:$JAVA_HOME:$PATH"

export NVM_DIR="$HOME/.nvm"
export ZSH_DIR="$HOME/.oh-my-zsh"

export EDITOR='vim'
export LS_COLORS="$(vivid generate dracula)"

# Define variables
local PROMPT_RESET="%F{255}"
local PROMPT_DIRECTORY="%F{185}"
local PROMPT_OK="%F{84}"
local PROMPT_ERR="%F{124}"
local PROMPT_DISK="%F{252}"
local PROMPT_GIT="%F{146}"

local RPROMPT_USER_ROOT="%F{1}"
local RPROMPT_USER_NORMAL="%F{11}"
local RPROMPT_HOSTNAME="%F{224}"
local RPROMPT_TIME="%F{244}"
local RPROMPT_EXECUTION_TIME="%F{141}"

local PROMPT_GIT_COMMIT_CLEAN="%F{112}"
local PROMPT_GIT_COMMIT_DIRTY="%F{196}"

local PROMPT_SEP_ICON="%F{238}󱪼${PROMPT_RESET}"
local PROMPT_EXECTIME_ICON="󱎫 "
local PROMPT_USAGE_DISK_ICON="󰗮 "
local PROMPT_DIRECTORY_ICON="󰉋 "
local PROMPT_OK_ICON="󰄬 "
local PROMPT_ERR_ICON=" "
local PROMPT_ICON="󰁕 "
local PROMPT_HOUR_ICON="󰥔 "
local PROMPT_ROOT_ICON=" "
local PROMPT_USER_ICON=" "
local PROMPT_GIT_ICON="󰊢 "
local PROMPT_GIT_COMMIT_ICON="󰜘 "

export ZSH_HIGHLIGHT_STYLES=(
    'default=fg=default,bold'         # Default style for normal text
    'comment=fg=gray,bold'            # Comments
    'keyword=fg=cyan,bold'            # Keywords (e.g., if, else, fi, for, while)
    'command=fg=green,bold'           # Commands (e.g., ls, cd, git)
    'alias=fg=green,bold'             # Aliases (user-defined shortcuts)
    'builtin=fg=green,bold'           # Built-in commands (e.g., echo, printf)
    'function=fg=blue,bold'           # Functions (defined by user)
    'parameter=fg=yellow,bold'        # Variables and parameters ($VAR, $1)
    'brace=fg=default,bold'           # Braces ( { } )
    'regex=fg=magenta,bold'           # Regular expressions
    'globbing=fg=magenta,bold'        # Globbing patterns (*, ?, [abc])
    'substitution=fg=default,bold'    # Command substitutions ( $(...) )
    'variable=fg=yellow,bold'         # Variable names
    'path=fg=default,bold'            # File paths
    'string=fg=default,bold'          # Strings (single-quoted and double-quoted)
    'operator=fg=default,bold'        # Operators (+, -, *, /, =)
    'number=fg=default,bold'          # Numbers (123, 3.14)
    'error=fg=red,bold'               # Errors and warnings
)