### BEGIN AUTO CONFIG ###
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

### END AUTO CONFIG ###

# Enable colors and change prompt:
autoload -U colors && colors    # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd       # Automatically cd into typed directory.
stty stop undef     # Disable ctrl-s to freeze terminal.

# Basic auto/tab complete:
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zmodload zsh/complist
_comp_options+=(globdots)       # Include hidden files.

# vi mode
KEYTIMEOUT=5

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]
    then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]
    then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select

_fix_cursor() {
    echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

### BEGIN VARIABLE ###
##
#

setopt EXTENDED_HISTORY

FIGNORE=".meta"

mnt="/mnt"
mntmbssh="/mnt/sshfs"
mntmb="/mnt/mybook"

VIMRC="$HOME/.vimrc"
ECHOSHRC="$HOME/.echo.shrc"
BASHPROF="$HOME/.bash_profile"
BASHRC="$HOME/.bashrc"
BASHHIST="$HOME/.bash_history"
ZSHRC="$HOME/.zshrc"
ZSHHIST="$HOME/.zsh_history"
ZPROFILE="$HOME/.zprofile"
SXHKDRC="$HOME/.config/sxhkd/sxhkdrc"
XINITRC="$HOME/.xinitrc"
RANGERRC="$HOME/.config/ranger/rc.conf"
MIMEAPPS="$HOME/.config/mimeapps.list"
WORKOUT="$HOME/documents/data-dump/workout.log"

pihole="192.168.1.100"

bt="E8:07:BF:1B:A1:CB"
mpow="EB:06:EF:5D:4F:4D"

#
##
### END VARIABLE ###

### BEGIN ALIAS ###
##
#

alias sudo="nocorrect sudo "
alias fuck="eval 'sudo !!'"

alias ls="ls --color=auto"

alias grep="grep --color=auto"
alias diff="colordiff"
alias vdiff="vimdiff"

alias ll="ls -lh"
alias l1="ls -1"
alias la="ls -A"
alias lal="ls -Alh"
alias lr="ls -lRh"
alias lar="ls -lARh"
alias lsd="ls -d"

alias cd.="cd .."
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias cdr="cd /"

alias mkd="mkdir"
alias to="touch"

alias fd="sudo fdisk"
alias cfd="sudo cfdisk"

alias compgen="print -rl -- \${(k)aliases} \${(k)functions} \${(k)parameters} \${(k)builtins} \${(k)commands}"
alias hgrep="hist | grep"
alias hgrepc="hist | grep -C 3"
alias cgrep="compgen | grep"
alias ygrep="yay -Q | grep"
alias lgrep="l1 | grep"
alias llgrep="ll | grep"
alias lrgrep="lr | grep"
alias ppgrep="ps aux | grep -E"

alias find="find -regextype grep"

alias udb="sudo updatedb"
alias udbm="sudo updatedb -U /mnt/mybook -o /var/lib/mlocate/mlocate-mybook.db"
alias loc="locate -i"
alias locm="locate -d /var/lib/mlocate/mlocate-mybook.db -i"

alias py="ptpython"
#alias py="python3"
alias pypy="pypy3"
alias gpp="g++"

alias v="vim"
alias b="broot"
alias z="zathura"
alias m="neomutt"

alias ve="v $ECHOSHRC"
alias vb="v $BASHRC"
alias vz="v $ZSHRC"
alias vzp="v $ZPROFILE"
alias vv="v $VIMRC"
alias vx="v $XINITRC"
alias vm="v $MIMEAPPS"
alias vs="v $SXHKDRC"
alias vw="v $WORKOUT"

alias pacman-autoremove="sudo pacman -Rcns $(pacman -Qdtq)"
alias pacman-list='LC_ALL=C pacman -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'

alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias smic="sudo make install clean"

alias SS="sudo systemctl"
alias S="systemctl --user"

alias xr="xrandr"
alias xkbd-fast="xset r rate 250 40"
alias xkbd-slow="xset r rate 600 25"
alias xc="xclip -sel clip"
alias xco="xclip -o -sel clip"

alias dhcp="sudo dhcpcd"

alias ssh="ssh -p 14253"
alias scp="scp -P 14253"

alias ka="killall"
alias rfk="rfkill"

alias sc="shellcheck"

alias mount="sudo mount"
alias umount="sudo umount"
alias rc="rclone"
alias fum="fusermount"

alias iotop="sudo iotop"
alias powertop="sudo powertop"
alias jnettop="sudo jnettop"
alias slabtop="sudo slabtop"

alias btmon="sudo btmon"

alias btctl="bluetoothctl"
alias tlmgr="tllocalmgr"
alias vol="pulseaudio-ctl"

alias gl="git log"
alias gr="git reset"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdw="git diff --word-diff"
alias gc="git commit"
alias gcd="git commit --dry-run"
alias gcm="git commit -m"
alias gco="git checkout"
alias gpl="git pull"
alias gps="git push"

alias ytdl='youtube-dl --add-metadata --mark-watched --geo-bypass --retries infinite --fragment-retries infinite --download-archive ~/documents/data-dump/download-archive -o "%(uploader)s_%(upload_date)s_%(id)s_%(title)s_%(timestamp)s.%(ext)s"'
alias pvpn="sudo protonvpn"
alias pvpnc="sudo protonvpn c --cc"

alias faceswap="python3.7 ~/.faceswap/faceswap/faceswap.py"
alias ycmgen="~/repo/YCM-Generator/config_gen.py"

alias ggl="googler"
alias gpupig="gpupdo "$( getloc igg )""

#
##
### END ALIAS ###

### BEGIN FUNCTION ###
##
#

zsudo() {
    sudo zsh -c "$functions[$1]" "$@"
}

hist() {
    [[ "$@" ]] && fc -li -$@ || fc -li 0
}

p() {
    sudo pacman $@

    statbarsetavlsyu
    statbarset
}

y() {
    yay $@

    statbarsetavlsyu
    statbarset
}

g() {
    [ "$2" ] && { echo "Only one argument is accepted."; return 1; }

    dir="$( getloc "$1" )"

    if [ -d "$dir" ]
    then
        cd "$dir"
    else
        echo "No such directory."
    fi
}

l() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

r() {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

ltxstp() {
    bibtex "$1"
    latexmk -pdf -pvc "$(pwd)/$1" > /dev/null &
    zathura "$(pwd)/$1.pdf" &
    disown
    exit
}

ltxcln() {
    killall perl
    killall zathura
    exit
}

cd() {
    if [ -d "$@" ] 
    then
        builtin cd "$@"
    else
        dir="$( getloc "$@" )"
        [ "$dir" ] && builtin cd "$dir"
    fi
}

ga() {
    if [ "$@" ]
    then
        git add $@
    else
        git add .
    fi
}

gcmm() {
    git commit -m "$1" -m "$2"
}

gdo() {
    if [ "$3" ]
    then
        git add "$1" && git commit -m "$2" -m "$3" && git push "$4" "$5" "$6"
    elif [ "$2" ]
    then
        git add "$1" && git commit -m "$2" && git push
    elif [ "$1" ]
    then
        git add . && git commit -m "$1" && git push
    else
        echo "No arguments given."
    fi
}

gdoe() {
    gdo $@
    exit
}

#
##
### END fUNCTION ###

### BEGIN KEYMAP ###
##
#

bindkey '^[[P' delete-char

bindkey '^r' history-beginning-search-backward
bindkey '^u' history-beginning-search-forward

autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

#
##
### END KEYMAP ###

source ~/repo/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

. ~/.echo.shrc
