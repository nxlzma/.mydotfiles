# Example aliases
alias cp='cp -i'                # Confirm before overwriting
alias mv='mv -i'                # Confirm before overwriting
alias rm='rm -i'                # Confirm before deleting
alias crdir='mkcd'              # Create parent directories and also changes cwd after creation
alias remdir='rm -i -r'         # Delete recursively and forcefully (unsafe!)
alias cpdir='cp -i -r'          # Copies whole directory
alias mvdir='mv -i -r'          # Moves whole directory
alias grep='grep --color=auto'  # ---
alias pls='sudo'                # Easy-on-hand alias for 'sudo'
alias restart='sudo reboot'     # Restarting system
alias getip='ip addr show'      # Show current IP (not public!!)
alias list='ls -lah'            # Display file list colorized with details