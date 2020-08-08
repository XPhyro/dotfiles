### BEGIN AUTO CONFIG ###
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.dotfiles-sensitive/.zsh_history
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
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
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
mntmb="/mnt/mybook"
mntmbssh="/mnt/sshfs"

BASHHIST="$HOME/.bash_history"
BASHPROF="$HOME/.bash_profile"
BASHRC="$HOME/.bashrc"
ECHOSHRC="$HOME/.echo.shrc"
GITCONFIG="$HOME/.gitconfig"
IDEAVIMRC="$HOME/.ideavimrc"
MIMEAPPS="$HOME/.config/mimeapps.list"
RANGERRC="$HOME/.config/ranger/rc.conf"
SXHKDRC="$HOME/.config/sxhkd/sxhkdrc"
VIMRC="$HOME/.vimrc"
WORKOUT="$HOME/documents/data-dump/workout.log"
XINITRC="$HOME/.xinitrc"
ZPROFILE="$HOME/.zprofile"
ZSHHIST="$HOME/.zsh_history"
ZSHRC="$HOME/.zshrc"

pihole="192.168.1.100"

bt="E8:07:BF:1B:A1:CB"
mpow="EB:06:EF:5D:4F:4D"

#
##
### END VARIABLE ###

### BEGIN ALIAS ###
##
#

alias fuck='sudo $( fc -ln -1 )'
alias sudo="nocorrect sudo "

alias ls="ls --color=auto"

alias diff="colordiff"
alias grep="grep --color=auto"
alias vdiff="vimdiff"

alias l1="ls -1"
alias la="ls -A"
alias lal="ls -Alh"
alias lar="ls -lARh"
alias ll="ls -lh"
alias lr="ls -lRh"
alias lsd="ls -d"

alias ....="../../.."
alias ...="../.."

alias cpr="cp -r"
alias mkd="mkdir"
alias mvr="mv -r"

alias cfd="sudo cfdisk"
alias cfdn="sudo cfdisk /dev/nvme0n1"
alias fd="sudo fdisk"

alias dffs="df -h | head -n 1; df -h | grep ^/dev/ --color=never"
alias dud="du -ch . | sort -h | less +G"

alias compgen="print -rl -- \${(k)aliases} \${(k)functions} \${(k)parameters} \${(k)builtins} \${(k)commands}"

alias cgrep="compgen | grep -i"
alias hgrep="hist | grep -i"
alias hgrepc="hist | grep -iC 3"
alias lalgrep="lal | grep -i"
alias lgrep="l1 | grep -i"
alias llgrep="ll | grep -i"
alias lrgrep="lr | grep -i"
alias ngrep="netstat -tulpn | grep -i"
alias pgrep="ps aux | grep -iE"
alias ppgrep="/usr/bin/pgrep"
alias ygrep="yay -Q | grep -i"
alias zsgrep="cat $ZSHRC | grep -i"

#alias find="find -regextype grep"

alias loc="locate -i"
alias locm="locate -d /var/lib/mlocate/mlocate-mybook.db -i"
alias udb="sudo updatedb"
alias udbm="sudo updatedb -U /mnt/mybook -o /var/lib/mlocate/mlocate-mybook.db"

alias ffm="ffmpeg"
alias ffp="ffprobe"

alias gpp="g++"
alias py="ptpython"
alias pypy="pypy3"
alias pyy="python3"

alias b="broot"
alias gv="gvim"
alias q="exit"
alias v="vim"
alias z="zathura"

alias td="todo"
alias tdc="todo copy"
alias tdd="todo delete"
alias tddo="todo done"
alias tde="todo edit"
alias tdf="todo flush"
alias tdh="todo --help"
alias tdl="todo list"
alias tdm="todo move"
alias tdn="todo new"
alias tds="todo show"
alias tdy="todo cancel"

alias f="fzfopen"
alias far="fzfopen ar"
alias fcc="fzfopen cc"
alias fco="fzfopen co"
alias fda="fzfopen da"
alias fdoc="fzfopen doc"
alias fdow="fzfopen dow"
alias fmb="fzfopen mb"
alias fmn="fzfopen mn"
alias fpi="fzfopen pi"
alias fpy="fzfopen py"
alias fre="fzfopen re"
alias fsh="fzfopen sh"

alias fq="fzfopen && exit"
alias fqar="fzfopen ar && exit"
alias fqcc="fzfopen cc && exit"
alias fqco="fzfopen co && exit"
alias fqda="fzfopen da && exit"
alias fqdoc="fzfopen doc && exit"
alias fqdow="fzfopen dow && exit"
alias fqmb="fzfopen mb && exit"
alias fqmn="fzfopen mn && exit"
alias fqpi="fzfopen pi && exit"
alias fqpy="fzfopen py && exit"
alias fqre="fzfopen re && exit"
alias fqsh="fzfopen sh && exit"

alias mdr="mdv README.md"
alias mdt="mdv TODO.md"

alias vb="v $BASHRC"
alias ve="v $ECHOSHRC"
alias vg="v $GITCONFIG"
alias viv="v $IDEAVIMRC"
alias vm="v $MIMEAPPS"
alias vr="v README.md"
alias vs="v $SXHKDRC"
alias vt="v TODO.md"
alias vv="v $VIMRC"
alias vw="v $WORKOUT"
alias vx="v $XINITRC"
alias vz="v $ZSHRC"
alias vzp="v $ZPROFILE"

alias yr="yay -R"
alias yrn="yay -Rns"
alias ys="yay -Ss"
alias yu="yay -Syu"

alias pacman-autoremove="sudo pacman -Rcns $(pacman -Qdtq)"
alias pacman-list='LC_ALL=C pacman -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'

alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias hsmic="./autogen.sh && ./configure --prefix=/usr && sudo make install"
alias smic="sudo make install clean"

alias S="systemctl --user"
alias s="sudo systemctl"

alias xc="xclip -sel clip"
alias xco="xclip -o -sel clip"
alias xkbd-fast="xset r rate 250 40"
alias xkbd-slow="xset r rate 600 25"
alias xr="xrandr"

alias netstat="sudo netstat"
alias netstatt="netstat -tulpn"

alias dhcp="sudo dhcpcd"

alias ping100="ping 192.168.1.100"
alias ping1="ping 192.168.1.1"
alias ping8="ping 8.8.8.8"
alias pingg="ping google.com"

alias scp="scp -P 14253"
alias ssh="ssh -p 14253"

alias ka="killall"
alias rfk="rfkill"

alias sc="shellcheck"

alias fum="fusermount"
alias mount="sudo mount"
alias rc="rclone"
alias umount="sudo umount"

alias iotop="sudo iotop"
alias jnettop="sudo jnettop"
alias powertop="sudo powertop"
alias slabtop="sudo slabtop"

alias btmon="sudo btmon"

alias btctl="bluetoothctl"
alias tlmgr="tllocalmgr"
alias vol="pulseaudio-ctl"

alias a2dpb="a2dp $bt"
alias a2dpbe="a2dp $bt && exit"
alias a2dpm="a2dp $mpow"
alias a2dpme="a2dp $mpow && exit"

alias ga.="git add ."
alias ga="git add"
alias gacm="git add . && git commit -m"
alias gb="git branch"
alias gba="git branch -a"
alias gbav="git branch -av"
alias gbu="git branch -u"
alias gbv="git branch -v"
alias gbva="git branch -av"
alias gc="git commit"
alias gcd="git commit --dry-run"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gdas="git diff Assets/Scripts"
alias gdc="git diff --cached"
alias gdw="git diff --word-diff"
alias gf="git fetch"
alias gi="git init"
alias gl="git log"
alias gmer="git merge"
alias gmerab="git merge --abort"
alias gmercon="git merge --continue"
alias gpl="git pull"
alias gplom="git pull origin master"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gpssu="git push --set-upstream"
alias gpst="git push --tags"
alias greb="git rebase"
alias grem="git remote"
alias grema="git remote add"
alias gremv="git remote -v"
alias gres="git reset"
alias gresh="git reset --hard"
alias gress="git reset --soft"
alias grest="git restore"
alias grests.="git restore --staged ."
alias grests="git restore --staged"
alias gst="git stash"
alias gstp="git stash apply"
alias gt="git tag"
alias gvb="git version-bump"

alias pvpn="sudo protonvpn"
alias pvpnc="sudo protonvpn c --cc"
alias ytdl='youtube-dl --add-metadata --mark-watched --geo-bypass --retries infinite --fragment-retries infinite --download-archive ~/documents/data-dump/download-archive -o "%(uploader)s_%(upload_date)s_%(id)s_%(title)s_%(timestamp)s.%(ext)s"'

alias faceswap="python3.7 ~/.faceswap/faceswap/faceswap.py"
alias ycmgen="~/repo/YCM-Generator/config_gen.py"

alias ggl="googler"
alias gpupig="gpupdo "$( getloc igg )""
alias trickle-gpupig="sudo trickled -d 1000 -u 400 & disown; trickle gpupdo "$( getloc igg )""

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

recordmrk() {
    mark="$1"
    mrk="$( getfl mrk )"
    #gawk -i inplace -F"\t" -v mrk='¬' -v PWD="$PWD" '$1 == mrk {$2=PWD}1' "$mrk"
    gawk -i inplace -v mrk="$mark" -v PWD="$PWD" '$1 == mrk {$2=PWD}1' "$mrk"
}

¬() {
    cat "$( getfl mrk )" | while read -r i
    do
        mrk="$( echo "$i" | awk '{print $1}' )"
        [ "$mrk" = "¬" ] && {
            recordmrk ¬
            cd "$( echo "$i" | awk '{print $2}' | expandpath )"
            return
        }
    done

    echo "Could not find the previous mark."
}

m() {
    mark="$1"
    mrk="$( getfl mrk )"

    if [ grep -Eq "$mark\s" "$mrk" ]
    then
        gawk -i inplace -v mrk='¬' -v PWD="$PWD" '$1 == mrk {$2=PWD}1' "$mrk"
    else

    fi
}

g() {
    [ "$2" ] && { echo "Only one argument is accepted."; return 1; }

    dir="$( getloc "$1" )"

    if [ -d "$dir" ]
    then
        recordmrk ¬
        cd "$dir"
    else
        echo "No such directory."
    fi
}

p() {
    hasopt=0

    for i in "$@"
    do
        [ "${i:0:1}" = "-" ] && {
            hasopt=1
            break
        }
    done

    if [ "$hasopt" = "1" ]
    then
        sudo pacman $@
    else
        sudo pacman -Syu $@
    fi

    statbarsetavlsyu
    statbarset
}

y() {
    hasopt=0

    for i in "$@"
    do
        [ "${i:0:1}" = "-" ] && {
            hasopt=1
            break
        }
    done

    if [ "$hasopt" = "1" ]
    then
        yay $@
    else
        yay -Syu $@
    fi

    statbarsetavlsyu
    statbarset
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

to() {
    for i in "$@"
    do
        [ -d "$i" -o -f "$i" ] && continue
        dir="$( dirname "$i" )"
        [ -d "$dir" ] || mkdir -p "$dir"
        touch "$i"
    done
}

tox() {
    for i in "$@"
    do
        to "$i" && chmod +x "$i"
    done
}

ltxstp() {
    bibtex "$1"
    zathura "$(pwd)/$1.pdf" &
    sleep 0.1
    latexmk -pdf -pvc "$(pwd)/$1" > /dev/null &
    disown
    exit
}

ltxcln() {
    kill "$( pgrep latexmk | head -n 1 | awk '{print $2}' )"
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

gaf() {
    find . -name "$1" -exec git add {} \;
}

gcmp() {
    git commit -m "$1" && git push
}

gcmm() {
    git commit -m "$1" -m "$2"
}

gcmmp() {
    git commit -m "$1" -m "$2" && git push
}

gacmm() {
    git add . && gcmm $@
}

gpsa() {
    if [ "$1" ]
    then
        git push "$1" && git push --tags "$1"
    else
        git push && git push --tags
    fi
}

gdo() {
    if [ "$3" ]
    then
        git add "$1" && git commit -m "$2" -m "$3" && git push "$4" "$5" "$6"
    elif [ "$2" ]
    then
        git add . && git commit -m "$1" -m "$2" && git push
    elif [ "$1" ]
    then
        git add . && git commit -m "$1" && git push
    else
        echo "No arguments given."
    fi
}

gdoom() {
    git branch -u origin/master
    gdo $@
}

gdoe() {
    gdo $@
    exit
}

greshh() {
    git reset --hard "HEAD~$1"
}

gressh() {
    git reset --soft "HEAD~$1"
}

md() {
    if [ "$@" ]
    then
        mdv $@
    else
        for i in *.md
        do
            mdv "$i"
        done
    fi
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

todo list
