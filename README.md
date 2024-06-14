# .mydotfiles

My collection of dot files. Used on **Debian 12.5.0** with **Z-shell** as default shell. <br>
Mainly **behavior and appearance** as well as **aliases**, **functions**.

In future it will also contain pwsh-related content.

## Dependencies
- [oh-my-zsh](https://ohmyz.sh)
- [nerd-fonts](https://www.nerdfonts.com)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)

# Additional content

`.zshrc` provides automatic NVM detection and initialization,
also it exports `JAVA_HOME`. I am using GraalVM, so I am exporting,
my GraalVM path.

# Notice
If you still wanna use .mydotfiles directory (or some other name),
u need to create proper symlink to .zshrc.

`.mydotfiles -> /home/../.zshrc`, by `ln -s`.