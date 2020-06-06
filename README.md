# dotfiles
This repository includes copies of my non-sensitive dotfiles that are automatically backed up by [dotfilesbak](dotfilesbak) when modified. Only the files or directories specified in [dotfiles.list](dotfiles.list) are backed up.

# Backing up
[dotfilesbak](dotfilesbak), along with inotifywait is used to back up the files specified in [dotfiles.list](dotfiles.list) automatically.

# Deploying
To deploy these dotfiles, simply clone the repository to "$HOME/.dotfiles", then run [dotfilesdeploy](dotfilesdeploy). It will REMOVE the conflicting files, then create the necessary links.

```
$ git clone https://github.com/XPhyro/dotfiles ~/.dotfiles
$ ~/.dotfiles/deploydotfiles
```

## Deploying: TL;DR
Using [dotfilesdeploy](dotfilesdeploy) will REMOVE YOUR CURRENT DOTFILES.
