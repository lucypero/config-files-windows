# Lucy's Windows configuration files

This was done following the instructions for how to version configuration files [from this article](https://www.atlassian.com/git/tutorials/dotfiles).

I talk about programming on windows [here](https://lucypero.com/blog/windows-development.html)

# Main Programs I use for development

- Sublime Text and Clion for text/code editing and navigation.
- Sublime Merge for managing Git repositories.
- Nushell as my shell.
- Windows Terminal as my terminal emulator.

# Installation

- Run this on Powershell:

  (**WARNING**: This will override all the files already in the system that have the same name as the ones on this repository.)

```ps1
cd
Set-Alias config ConfigGit
function ConfigGit {
git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args
}
git clone --bare https://github.com/lucypero/config-files-windows.git $HOME\.cfg
config checkout --force
config config --local status.showUntrackedFiles no
Install-Module -Force PSReadLine # (optional). This is only if you want dropdown autocomplete on Powershell
```

- Reload the shell.
