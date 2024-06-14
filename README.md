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
- keychain: I don't have a link, it's in Ubuntu/Debian repositories, just google.

# Additional content

`.zshrc` provides automatic NVM detection and initialization,
also it exports `JAVA_HOME`. I am using GraalVM, so I am exporting,
my GraalVM path.

As well as `keychain`, SSH key manager.
Currently it imports key named `ssh_key_github`, which u need to generate for yourself,
if u wanna use that functionality. (i ain't gonna give y'all my ssh key imho that would
be dumb (unless...?))

# Notice
If you still wanna use .mydotfiles directory (or some other name),
u need to create proper symlink to .zshrc.

`.mydotfiles -> /home/../.zshrc`, by `ln -s`.

**Remember to set your own $HOME path. Paths are manually written for purpose.
I am using the same `.zshrc` for my root account. I know there is a better way to handle,
that kind of stuff - I will soon, maybe.**