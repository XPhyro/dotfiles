[[ $- != *i* ]] && return

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

# Enable colours and change prompt:
autoload -U colors && colors    # Load colours
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
setopt histignorespace

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
SXHKDRC="$HOME/.config/sxhkd/sxhkdrc"
VIMRC="$HOME/.vimrc"
WORKOUT="$HOME/documents/data-dump/workout.log"
XINITRC="$HOME/.xinitrc"
XRESOURCES="$HOME/.Xresources"
ZATHURARC="$HOME/.config/zathura/zathurarc"
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

alias mp="modprobe"
alias mpr="modprobe -r"

alias fuck='sudo $( fc -ln -1 )'
alias sudo="nocorrect sudo "
alias sudod="/usr/bin/sudo"

alias c="clear"

alias watch="watch "

alias diff="colordiff"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias vdiff="vimdiff"

alias l1="ls -1"
alias la="ls -A"
alias lal="ls -Alh"
alias lar="ls -lARh"
alias ll="ls -lh"
alias lr="ls -lRh"
alias lsd="ls -d"

alias ..........="cd ../../../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ........="cd ../../../../../../.."
alias .......="cd ../../../../../.."
alias ......="cd ../../../../.."
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."

alias q="exit"
alias qq="exit"
alias qqq="exit"

alias bash="HISTFILE= bash"
alias sh="HISTFILE= sh"

alias cpr="cp -r"
alias mkd="mkdir -p"
alias rmr="rm -r"
alias mvr="mv -r"
alias prm="progress -m"
alias prM="progress -M"

alias cfd="sudo cfdisk"
alias cfdn="sudo cfdisk /dev/nvme0n1"
alias mount="sudo mount"
alias sfd="sudo fdisk"

alias dffs="df -h | head -n 1; df -h | grep ^/dev/ --color=never"
alias dffsw="watch -n 5 'df -h | head -n 1; df -h | grep ^/dev/ --color=never'"
alias dud="du -ch . | sort -h | less +G"

alias compgen="print -rl -- \${(k)aliases} \${(k)functions} \${(k)parameters} \${(k)builtins} \${(k)commands}"

alias cgrep="compgen | grep -i"
alias hgrep="hist | grep -i"
# alias hcgrep="hist | awk '{$1=$2=$3=""; print substr($0,2)}' | grep -i" # TODO: Works as standalone, but alias gives error, fix.
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
alias locs="locate"
alias locm="locate -d /var/lib/mlocate/mlocate-mybook.db -i"
alias locms="locate -d /var/lib/mlocate/mlocate-mybook.db"
alias udb="sudo updatedb"
alias udbm="sudo updatedb -U /mnt/mybook -o /var/lib/mlocate/mlocate-mybook.db"

alias ffm="ffmpeg -hide_banner"
alias ffmt="ffmpegthumbnailer"
alias ffp="ffprobe -hide_banner"

alias gpp="g++"

alias ptpy="ptpython"
alias py2="python2"
alias py="python"
alias pypy="pypy3"

alias R="R -q"
alias Rs="R -s"
alias mat="matlab &!"

alias b="broot"
alias v="vim"

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

PATH_OF_FD_BIN="$( where fd )"
alias fd='cd "$('"$PATH_OF_FD_BIN"' -t d | fzf )"'
unset PATH_OF_FD_BIN

alias mdr="mdv README.md"
alias mdt="mdv TODO.md"

alias vb="v $BASHRC"
alias vc="v config.h"
alias vcd="v config.def.h"
alias ve="v $ECHOSHRC"
alias vg="v .gitignore"
alias vgc="v $GITCONFIG"
alias viv="v $IDEAVIMRC"
alias vm="latexstp main > /dev/null 2>&1 &; v main.tex"
alias vma="v Makefile"
alias vmc="v main.c"
alias vmem="sudo v /sys/power/{mem_sleep,state}"
alias vmim="v $MIMEAPPS"
alias vmt="v main.tex"
alias vs="v $SXHKDRC"
alias vv="v $VIMRC"
alias vw="v $WORKOUT"
alias vx="v $XINITRC"
alias vxr="v $XRESOURCES"
alias vz="v $ZSHRC"
alias vza="v $ZATHURARC"
alias vzp="v $ZPROFILE"

alias u="y; echo; update"
alias uq="y; echo; update && exit"
alias uy="update"

alias ye="y && exit"
alias yf="yay -F"
alias yq="yay -Q"
alias yqe="yay -Qe"
alias yqkk="yay -Qkk"
alias yqu="yay -Qu"
alias yr="yay -R"
alias yrn="yay -Rns"
alias ys="yay -Ss"
alias ysc="yes | yay -Sc"
alias yss="yay -S"
alias yu="yay -Syu"

alias pacman-autoremove="sudo pacman -Rcns $(pacman -Qdtq)"
alias pacman-list='LC_ALL=C pacman -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'
alias yay-autoremove="yay -Rcns $(yay -Qdtq)"
alias yay-list='LC_ALL=C yay -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'

alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias cmsmic="rm -f config.h; make; sudo make install clean"
alias hsmic="./autogen.sh && ./configure --prefix=/usr && sudo make install"
alias msmic="make; sudo make install clean"
alias sm"sudo make"
alias smi="sudo make install"
alias smic="sudo make install clean"

alias S="systemctl --user"
alias s="sudo systemctl"

alias xc="xclip -sel clip"
alias xco="xclip -o -sel clip"
alias xds="xset dpms force suspend" # TODO: Add a sleep version of this as a function.
alias xdsq="xset dpms force suspend && exit" # TODO: Add a sleep version of this as a function.
alias xevv="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias xkbd-fast="xset r rate 250 40"
alias xkbd-slow="xset r rate 600 25"
alias xkbset="setxkb"
alias xr="xrandr"

alias rwall="restart-wallpaper &!"

alias netstat="sudo netstat"
alias netstatt="netstat -tulpn"

alias dhcp="sudo dhcpcd"
alias wpac="sudo rm /run/wpa_supplicant/wlan0; sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf && sudo dhcpcd; until ping -c1 google.com; do sleep 0.5s; done"

alias ping100="ping 192.168.1.100"
alias ping1="ping 192.168.1.1"
alias ping8="ping 8.8.8.8"
alias pingg="ping google.com"
alias pingn="pingnotif 192.168.1.1 8.8.8.8 google.com &!"

alias stl="speedtestlog"
alias stlp="speedtestlogp | less +G"

alias myip="curl ipinfo.io/ip"

alias scp="scp -P 14253"
alias ssh="ssh -p 14253"

alias ka="sudo killall"
alias rfk="sudo rfkill"

alias sc="shellcheck"

alias fum="fusermount"
alias mount="sudo mount"
alias rc="sudo rclone"
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
alias am="alsamixer"
alias lpbkoff="pactl unload-module module-loopback"
alias lpbkon="pactl load-module module-loopback latency_msec=1"

alias ga.="git add ."
alias ga="git add"
alias gacm="git add . && git commit -m"
alias gacmre='git add . && git commit -m "Update README.md"'
alias gacmto='git add . && git commit -m "Update TODO.md"'
alias gb="git branch"
alias gba="git branch -a"
alias gbav="git branch -av"
alias gbu="git branch -u"
alias gbv="git branch -v"
alias gbva="git branch -av"
alias gc="git commit"
alias gca="git commit --amend"
alias gcd="git commit --dry-run"
alias gcdl="git -c color.status=always commit --dry-run | less -r"
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
alias gpsa="git push --all"
alias gpsf="git push --force-with-lease"
alias gpssu="git push --set-upstream"
alias gpssuom="git push --set-upstream origin master"
alias gpst="git push --tags"
alias greb="git rebase"
alias grem="git remote"
alias grema="git remote add"
alias gremao="git remote add origin"
alias gremsu="git remote set-url"
alias gremsuo="git remote set-url origin"
alias gremv="git remote -v"
alias gres="git reset"
alias gresh="git reset --hard"
alias gress="git reset --soft"
alias grest="git restore"
alias grests.="git restore --staged ."
alias grests="git restore --staged"
alias gsma="git submodule add"
alias gsmuir="git submodule update --init --recursive"
alias gst="git stash"
alias gsta="git stash apply"
alias gstl="git stash list"
alias gstp="git stash apply"
alias gstp="git stash pop"
alias gsts="git stash show"
alias gsuno="git status -uno"
alias gt="git tag"
alias gvb="git version-bump"

alias ltxs="latexstp"
alias ltxso="latexstp '' -o"

alias protonvpn="sudo protonvpn"
alias pvpn="protonvpn"
alias pvpnc="protonvpn c --cc"
alias pvpncn="protonvpn c --cc nl"
alias pvpnd="protonvpn d"

alias base_ytdl='youtube-dl --add-metadata --mark-watched --geo-bypass --retries 25 --fragment-retries 25 -o "%(uploader)s_%(upload_date)s_%(id)s_%(title)s_%(timestamp)s.%(ext)s" --prefer-free-formats -i'
alias base_ytdl_log='youtube-dl --add-metadata --mark-watched --geo-bypass --retries 25 --fragment-retries 25 --download-archive ~/documents/data-dump/download-archive -o "%(uploader)s_%(upload_date)s_%(id)s_%(title)s_%(timestamp)s.%(ext)s" --prefer-free-formats -i'
alias base_ytdl_short='youtube-dl --add-metadata --mark-watched --geo-bypass --retries 25 --fragment-retries 25 -o "%(uploader)s_%(upload_date)s_%(id)s_%(timestamp)s.%(ext)s" --prefer-free-formats -i'
alias base_ytdl_short_log='youtube-dl --add-metadata --mark-watched --geo-bypass --retries 25 --fragment-retries 25 --download-archive ~/documents/data-dump/download-archive -o "%(uploader)s_%(upload_date)s_%(id)s_%(timestamp)s.%(ext)s" --prefer-free-formats -i'
alias ytdl='base_ytdl_log --merge-output-format mkv'
alias ytdla='base_ytdl_log -x'
alias ytdlnolog='base_ytdl --merge-output-format mkv'
alias ytdlnologa='base_ytdl -x'
alias ytdlshort='base_ytdl_short_log --merge-output-format mkv'
alias ytdlshorta='base_ytdl_short_log -x'
alias ytdlshortnolog='base_ytdl_short --merge-output-format mkv'
alias ytdlshortnologa='base_ytdl_short -x'

alias rdf="rdfind"
alias rdfdow='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$( mktemp /tmp/rdfind-rdfdow-p-log.XXXXXX )" -dryrun false ~/downloads/p; echo; rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks false -deleteduplicates true -outputname "$( mktemp /tmp/rdfind-rdfdow-log.XXXXXX )" -dryrun false ~/downloads'
alias rdfl='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$( mktemp /tmp/rdfind-rdfl-log.XXXXXX )" -dryrun false'
alias rdfp='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$( mktemp /tmp/rdfind-rdfp-log.XXXXXX )" -dryrun false ~/archive/p/p'
alias rdfr='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks false -deleteduplicates false -outputname "$( mktemp /tmp/rdfind-rdfr-log.XXXXXX )" -dryrun false'

alias syncp="symlinks -cr ~/downloads/p/ && rdfdow && rsync -abviuzP --remove-source-files ~/downloads/p/ ~/archive/p/p/"

alias faceswap="python3.7 ~/.faceswap/faceswap/faceswap.py"
alias ycmgen="~/repo/YCM-Generator/config_gen.py"

alias ggl="googler"
alias gpupig='gpupdo "$( getloc igg )"'
alias trickle-gpupig='sudo trickled -d 1000 -u 400 &!; trickle gpupdo "$( getloc igg )"'

alias ue4="~/archive/unreal-engine/Engine/Binaries/Linux/UE4Editor"
alias ue4c="~/archive/unreal-engine/Engine/Binaries/Linux/UE4Editor-Cmd"
alias ue4genp="~/archive/unreal-engine/GenerateProjectFiles.sh"
alias uh="~/programs/squashfs-root/unityhub"

alias unturned-server="~/data/steamlib/steamapps/common/U3DS/GLUK.sh"

#
##
### END ALIAS ###

### BEGIN FUNCTION ###
##
#

fork() {
    ("$@") &!
}

zsudo() {
    sudo zsh -c "$functions[$1]" "$@"
}

hist() {
    [ "$1" ] && return
    [[ "$@" ]] && fc -li -$@ || fc -li 0
}

manb() {
    if [ -z "$1" ]
    then
        man bash | less +/^SHELL\ BUILTIN\ COMMANDS$
    elif [ -z "$2" ]
    then
        man bash | less +/^SHELL\ BUILTIN\ COMMANDS$''/"^       $1"''/"$1"
    else
        echo "Only one argument is accepted."
    fi
}

changemark() {
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
            changemark ¬
            cd "$( echo "$i" | awk '{print $2}' | expandpath )"
            return
        }
    done

    echo "Could not find the previous mark."
}

m() {
    mark="$1"
    mrk="$( getfl mrk )"

    grep -Eq "$mark\s" "$mrk" && { 
        changemark "$mark"
        return
    }

    echo "$mark $PWD" >> "$mrk"
}

@() {
    mark="$1"

    cat "$( getfl mrk )" | while read -r i
    do
        mrk="$( echo "$i" | awk '{print $1}' )"
        [ "$mrk" = "$mark" ] && {
            cd "$( echo "$i" | awk '{print $2}' | expandpath )"
            return
        }
    done

    echo "Mark $mark does not exist."
}

g() {
    [ "$2" ] && { 
        echo "Only one argument is accepted."
        return 1
    }

    [ "$1" ] || {
        cd
        return
    }

    dir="$( getlocall "$1" )"

    if [ -d "$dir" ]
    then
        changemark ¬
        cd "$dir"
    else
        echo "No such directory."
        return 1
    fi
}

f() {
    [ "$1" = "-c" ] && {
        cont="1"
        shift
    }

    fail="0"
    until [ "$fail" = "1" ]
    do
        if [ "$@" ]
        then
            for i
            do
                fzfopen "$( getloc "$i" )" || fail="1"
            done
        else
            fzfopen || fail="1"
        fi
    done
}

fq() {
    f "$@" && exit
}

l() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    }
}

r() {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    }
}

grl() {
    g "$@" && l
}

gr() {
    g "$@" && r
}

p() {
    hasopt=0

    for i in
    do
        [ "${i:0:1}" = "-" ] && {
            hasopt=1
            break
        }
    done

    if [ "$hasopt" = "1" ]
    then
        sudo pacman "$@"
    elif [ "$@" ]
    then
        sudo pacman -S "$@"
    else
        sudo pacman -Syu "$@"
    fi

    statbarsetavlsyu
    statbarset
}

# TODO: Make y do -S instead of -Syu when trying to install a package that is not installed.
y() {
    hasopt=0

    for i in
    do
        [ "${i:0:1}" = "-" ] && {
            hasopt=1
            break
        }
    done

    if [ "$hasopt" = "1" ]
    then
        yay "$@"
    elif [ "$@" ]
    then
        yay -S "$@"
    else
        yay -Syu "$@"
    fi

    {statbarsetavlsyu && statbarset} &!
    # [ -z "$( jobs | grep "$!" )" ] || disown "$!"
}

z() {
    if [ "$2" = "" ]
    then
        zathura "$@" &
    else
        tabbed -c zathura "$@" -e &
    fi
}

zd() {
    z "$@" &!
}

to() {
    for i
    do
        [ -d "$i" -o -f "$i" ] && {
            touch "$i"
            continue
        }
        dir="$( dirname "$i" )"
        [ -d "$dir" ] || mkdir -p "$dir"
        touch "$i"
    done
}

tox() {
    for i
    do
        to "$i" && chmod +x "$i"
    done
}

toxv() {
    for i
    do
        tox "$i"
        vim "$i"
    done
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

vl() {
    if [ -f "COPYING" ]
    then
        v "COPYING"
    else
        v "LICENSE"
    fi
}

vr() {
    if [ -f "README" ]
    then
        v "README"
    else
        v "README.md"
    fi
}

vt() {
    if [ -f "TODO" ]
    then
        v "TODO"
    else
        v "TODO.md"
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
    git add . && gcmm "$@"
}

# gpsaa() {
#     if [ "$1" ]
#     then
#         git push "$1" && git push --tags "$1"
#     else
#         git push && git push --tags
#     fi
# }

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
    gdo "$@"
}

gdoe() {
    gdo "$@"
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
        mdv "$@"
    else
        for i in *.md
        do
            mdv "$i"
        done
    fi
}

gccc() {
    # if [ "$2" = "" ]
    # then
    #     prg="program"
    # else
    #     prg="$2"
    # fi

    # if [ "$1" = "" ]
    # then
    #     fl="main.c"
    # else
    #     fl="$1"
    # fi

    #gcc "$fl" -o "$prg" && "./$prg"

    gcc main.c -o program && ./program "$@"
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
source ~/.autojump/share/autojump/autojump.zsh

sed -e '/^#/d' -e 's/#.*//' -e 's/\\//g' ~/.echo.shrc

# todo list
