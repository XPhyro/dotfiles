# dotfiles
This repository includes copies of my non-sensitive dotfiles that are automatically backed up by [backup](backup) when modified. Only the files or directories specified in [dotfiles.list](dotfiles.list) are backed up.

# Backing up
[backup](backup), along with inotifywait is used to back up the files specified in [dotfiles.list](dotfiles.list) automatically.

# Deploying
To deploy these dotfiles, simply clone the repository to "$HOME/.dotfiles", then run [deploydotfiles](deploydotfiles). It will REMOVE the conflicting files, then create the necessary links.

```
$ git clone "https://github.com/XPhyro/dotfiles" ~/.dotfiles
$ ~/.dotfiles/deploydotfiles
```

# Deploying: TL;DR
Using [deploydotfiles](deploydotfiles) will REMOVE YOUR CURRENT DOTFILES.
