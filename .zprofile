export HISTCONTROL="ignorespace"
export HISTFILE="$HOME/.dotfiles-sensitive/.zsh_history"
export HISTTIMEFORMAT="[%F %T] "

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.local/bin/usr:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/code/sh:$PATH"
export PYTHONPATH="$PYTHONPATH:$HOME/code/py/_modules"

export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="brave"
export EDITOR="vim"
export OPENER="xdg-open"
export PAGER="less"
export READER="zathura"
export TERMINAL="st"
export VISUAL="vim"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP="KDE"
export XDG_DATA_HOME="$HOME/.local/share"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GIT_PAGER="bat --style=plain"

export LS_COLORS="$( vivid generate molokai )"
export MDV_THEME=663.6093

# adapted from LukeSmith/voidrice
export LF_ICONS="di=📁:
fi=📃:
tw=🤝:
ow=📂:
ln=⛓:
or=❌:
ex=🎯:
*.txt=✍:
*.mom=✍:
*.me=✍:
*.ms=✍:
*.png=🖼:
*.webp=🖼:
*.ico=🖼:
*.jpg=📸:
*.jpe=📸:
*.jpeg=📸:
*.gif=🖼:
*.svg=🗺:
*.tif=🖼:
*.tiff=🖼:
*.xcf=🖌:
*.html=🌎:
*.xml=📰:
*.gpg=🔒:
*.css=🎨:
*.pdf=📚:
*.djvu=📚:
*.epub=📚:
*.csv=📓:
*.xlsx=📓:
*.tex=📜:
*.md=📘:
*.r=📊:
*.R=📊:
*.rmd=📊:
*.Rmd=📊:
*.m=📊:
*.mp3=🎵:
*.opus=🎵:
*.ogg=🎵:
*.m4a=🎵:
*.flac=🎼:
*.wav=🎼:
*.mkv=🎥:
*.mp4=🎥:
*.webm=🎥:
*.mpeg=🎥:
*.avi=🎥:
*.mov=🎥:
*.mpg=🎥:
*.wmv=🎥:
*.m4b=🎥:
*.flv=🎥:
*.zip=📦:
*.rar=📦:
*.7z=📦:
*.tar.gz=📦:
*.z64=🎮:
*.v64=🎮:
*.n64=🎮:
*.gba=🎮:
*.nes=🎮:
*.gdi=🎮:
*.1=ℹ:
*.nfo=ℹ:
*.info=ℹ:
*.log=📙:
*.iso=📀:
*.img=📀:
*.bib=🎓:
*.ged=👪:
*.part=💔:
*.torrent=🔽:
*.jar=♨:
*.java=♨:"

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1  ] && {
    export XDG_SESSION_TYPE=x11
    startx
    tglapp --clean
}
