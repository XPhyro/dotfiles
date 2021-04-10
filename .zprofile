export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="$HOME/.dotfiles-sensitive/.zsh_history"
export HISTCONTROL="ignorespace"

export PATH="$HOME/.local/bin/usr:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/code/sh:$PATH"
export PATH="$HOME/.vim/bundle/vim-live-latex-preview/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PYTHONPATH="$PYTHONPATH:$HOME/code/py/_modules"

export DOTNET_CLI_TELEMETRY_OPTOUT="true"

export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="brave"
export EDITOR="vim"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"
export VISUAL="vim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CURRENT_DESKTOP="KDE"

export MDV_THEME=663.6093
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && {
    export XDG_SESSION_TYPE=x11
    startx
    tglapp --clean
}
