
# Z-shell options
setopt NO_BEEP
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt HIST_IGNORE_DUPS
setopt NOCASEGLOB
setopt PROMPT_SUBST

# Permissions stuff
umask 022
chmod go-rwx $HOME

# Autoload modules
autoload -Uz colors
autoload -Uz compinit
autoload -Uz promptinit

colors
compinit
promptinit

# Initialize oh-my-zsh plugins
plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
)

# Initialize nvm (if installed)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Initialize keychain
[ -s "/home/nx/.ssh/ssh_key_github" ] && eval $(keychain --quiet --agents ssh --eval /home/nx/.ssh/ssh_key_github)

# Sourcing .mydotfiles
[ -s "/home/nx/.mydotfiles/zsh_aliases.zsh" ] && source /home/nx/.mydotfiles/zsh_aliases.zsh
[ -s "/home/nx/.mydotfiles/zsh_variables.zsh" ] &&source /home/nx/.mydotfiles/zsh_variables.zsh
[ -s "/home/nx/.mydotfiles/zsh_functions.zsh" ] &&source /home/nx/.mydotfiles/zsh_functions.zsh
[ -s "/home/nx/.mydotfiles/zsh_prompt.zsh" ] &&source /home/nx/.mydotfiles/zsh_prompt.zsh

# Run oh-my-zsh init script
source $ZSH_DIR/oh-my-zsh.sh


