export HISTTIMEFORMAT="[%F %T] "

export HISTFILE="$HOME/.dotfiles-sensitive/.zsh_history"

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/usr
export PATH=$PATH:$HOME/code/sh
export PATH=$PATH:$HOME/.vim/bundle/vim-live-latex-preview/bin
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PYTHONPATH=$PYTHONPATH:$HOME/code/py/_modules

export DOTNET_CLI_TELEMETRY_OPTOUT="true"

export _JAVA_AWT_WM_NONREPARENTING=1

export TERMINAL="st"
export EDITOR="vim"
export BROWSER="google-chrome-stable"
export READER="zathura"

export MDV_THEME=663.6093

#[ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && exec startx "$SCRIPTSFOLDER/xinitrc"
[ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && startx
