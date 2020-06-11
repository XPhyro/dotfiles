export HISTTIMEFORMAT="[%F %T] "

export HISTFILE=~/.dotfiles-sensitive/.zsh_history

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/bin/usr
export PATH=$PATH:~/code/sh
export PATH=$PATH:~/.vim/bundle/vim-live-latex-preview/bin
export PYTHONPATH=$PYTHONPATH:$HOME/code/py/_modules

export DOTNET_CLI_TELEMETRY_OPTOUT="true"

export _JAVA_AWT_WM_NONREPARENTING=1

export TERMINAL="st"
export EDITOR="vim"
export BROWSER="google-chrome-stable"
export READER="zathura"

#[ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && exec startx "$SCRIPTSFOLDER/xinitrc"
[ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && startx
