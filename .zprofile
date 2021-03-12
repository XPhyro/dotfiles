export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="$HOME/.dotfiles-sensitive/.zsh_history"
export HISTCONTROL="ignorespace"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/usr"
export PATH="$PATH:$HOME/code/sh"
export PATH="$PATH:$HOME/.vim/bundle/vim-live-latex-preview/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export PYTHONPATH="$PYTHONPATH:$HOME/code/py/_modules"

export DOTNET_CLI_TELEMETRY_OPTOUT="true"

export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="brave"
export EDITOR="vim"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"

export MDV_THEME=663.6093

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && {
    export XDG_SESSION_TYPE=x11
    exec startx
}
