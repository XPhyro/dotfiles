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

setopt rmstarsilent

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

alias bgq="bg && disown && exit"

alias mp="modprobe"
alias mpr="modprobe -r"

alias fck='sudo !!'
alias fuck='sudo $( fc -ln -1 )'
alias sudo="nocorrect sudo "
alias sudod="/usr/bin/sudo"

alias c="clear"

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
alias du="du -L"
alias dud="du -ch . | sort -h | less +G"

alias compgen="print -rl -- \${(k)aliases} \${(k)functions} \${(k)parameters} \${(k)builtins} \${(k)commands}"

alias cgrep="compgen | grep -i"
alias hgrep="hist | grep -i"
alias hgrepi="hist | grep"
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

alias sfct="sudo fcrontab -e"
alias fct="fcrontab -e"

alias udb="sudo updatedb"
alias udba="udb; udbm"
alias udbm="sudo updatedb -U /mnt/mybook -o /var/lib/mlocate/mlocate-mybook.db"

alias loc="locate -i"
alias locd="located -i"
alias locds="located"
alias locf="locatef -i"
alias locfs="locatef"
alias locm="locate -d /var/lib/mlocate/mlocate-mybook.db -i"
alias locmd="located -d /var/lib/mlocate/mlocate-mybook.db -i"
alias locmds="located -d /var/lib/mlocate/mlocate-mybook.db"
alias locmf="locatef -d /var/lib/mlocate/mlocate-mybook.db -i"
alias locmfs="locatef -d /var/lib/mlocate/mlocate-mybook.db"
alias locms="locate -d /var/lib/mlocate/mlocate-mybook.db"
alias locs="locate"

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
alias me="mapexec"
alias mea="mapexec -a"
alias mem="mapexec -m"
alias meu="mapexec -u"
alias mew="mapexec -w"
alias v="vim"

alias sv="sudo v"

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
alias vs="v $SXHKDRC && restart-sxhkd"
alias vv="v $VIMRC"
alias vw="v $WORKOUT"
alias vx="v $XINITRC"
alias vxr="v $XRESOURCES"
alias vz="v $ZSHRC"
alias vza="v $ZATHURARC"
alias vzp="v $ZPROFILE"

alias u="y && echo && update"
alias uq="y && echo && update && exit"

alias ye="y && exit"
alias yf="yay -F"
alias yq="yay -Q"
alias yqe="yay -Qe"
alias yqkk="yay -Qkk"
alias yql="yay -Ql"
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

alias s="sudo systemctl"
alias sd="sudo systemctl disable"
alias sdn="sudo systemctl disable --now"
alias sdr="sudo systemctl daemon-reload"
alias se="sudo systemctl enable"
alias sen="sudo systemctl enable --now"
alias soff="sudo systemctl stop"
alias son="sudo systemctl start"
alias sre="sudo systemctl restart"
alias ss="sudo systemctl status"
alias su="systemctl --user"
alias sud="systemctl --user disable"
alias sudn="systemctl --user disable --now"
alias sudr="systemctl --user daemon-reload"
alias sue="systemctl --user enable"
alias suen="systemctl --user enable --now"
alias suoff="systemctl --user stop"
alias suon="systemctl --user start"
alias sure="systemctl --user restart"
alias sus="systemctl --user status"

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

alias ping0="ping 127.0.0.1"
alias ping100="ping 192.168.1.100"
alias ping1="ping 192.168.1.1"
alias ping8="ping 8.8.8.8"
alias pingg="ping google.com"
alias pingn="pingnotif 192.168.1.1 8.8.8.8 google.com &!"

alias stl="speedtestlog"
alias stlp="speedtestlogp | less +G"

alias myip="curl ipinfo.io/ip && printf '\n'"

alias scp="scp -P 14253"
alias ssh="ssh -p 14253"

alias ka="sudo killall"
alias rfk="sudo rfkill"

alias sc="shellcheck -e SC2188"

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
alias gbd="git branch -d"
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
alias gcod="git checkout -d"
alias gcoo="git checkout --orphan"
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
alias gnum="git rev-list --all --count"
alias gpl="git pull"
alias gplom="git pull origin master"
alias gps="git push"
alias gpsa="git push --all"
alias gpsd="git push -d"
alias gpsf="git push --force-with-lease"
alias gpssu="git push --set-upstream"
alias gpssuom="git push --set-upstream origin master"
alias gpst="git push --tags"
alias greb="git rebase"
alias gref="git reflog"
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
alias grm="git rm"
alias grmc="git rm --cached"
alias gsma="git submodule add"
alias gsmuir="git submodule update --init --recursive"
alias gst="git stash"
alias gsta="git stash apply"
alias gstd="git stash show -p"
alias gstl="git stash list"
alias gstp="git stash apply"
alias gstp="git stash pop"
alias gsts="git stash show"
alias gsuno="git status -uno"
alias gt="git tag"
alias gvb="git version-bump"

alias ltxs="latexstp"
alias ltxso="latexstp '' -o"
alias ltxsoq="latexstp '' -o && exit"

alias vpn="sudo protonvpn"
alias vpnc="sudo protonvpn c"
alias vpncc="sudo protonvpn c --cc ch"
alias vpncd="sudo protonvpn c --cc de"
alias vpncf="sudo protonvpn c -f"
alias vpncn="sudo protonvpn c --cc nl"
alias vpnd="sudo protonvpn d"
alias vpnr="sudo protonvpn r"
alias vpns="sudo protonvpn s"

alias vpnccq="sudo protonvpn c --cc ch && exit"
alias vpncdq="sudo protonvpn c --cc de && exit"
alias vpncfq="sudo protonvpn c -f && exit"
alias vpncnq="sudo protonvpn c --cc nl && exit"
alias vpncq="sudo protonvpn c --cc && exit"
alias vpndq="sudo protonvpn d && exit"
alias vpnq="sudo protonvpn && exit"
alias vpnrq="sudo protonvpn r && exit"
alias vpnsq="sudo protonvpn s && exit"

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

alias syncp="rdfdow && symlinks -cr ~/downloads/p/ && rsync -abviuzP --remove-source-files ~/downloads/p/ ~/archive/p/p/ && rdfp"

alias faceswap="python3.7 ~/.faceswap/faceswap/faceswap.py"
alias w2x="waifu2x-converter-cpp"
alias ycmgen="~/repo/YCM-Generator/config_gen.py"

alias ggl="googler"
alias gpupig='gpupdo "$( getloc igg )"'
alias trickle-gpupig='sudo trickled -d 1000 -u 400 &!; trickle gpupdo "$( getloc igg )"'

alias ue4="~/archive/unreal-engine/Engine/Binaries/Linux/UE4Editor"
alias ue4c="~/archive/unreal-engine/Engine/Binaries/Linux/UE4Editor-Cmd"
alias ue4genp="~/archive/unreal-engine/GenerateProjectFiles.sh"
alias uh="~/programs/squashfs-root/unityhub"

alias ddad="dragon-drag-and-drop -a -x"

alias tetris="autoload -Uz tetriscurses && tetriscurses"

#
##
### END ALIAS ###

### BEGIN FUNCTION ###
##
#

fork() {
    ("$@") &!
}

t() {
    [ "$#" -eq 0 ] && return 1
    n="$1"
    shift
    time (for _ in {1.."$n"}; do "$@"; done)
}

tn() {
    [ "$#" -eq 0 ] && return 1
    n="$1"
    shift
    time (for _ in {1.."$n"}; do {"$@"} > /dev/null; done)
}

dountil() {
    until eval "$@"
    do
        :
    done
}

dowhile() {
    while eval "$@"
    do
        :
    done
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
        printf "Only one argument is accepted.\n"
    fi
}

cd() {
    dir="$1"
    if [ -n "$dir" ] && [ ! -d "$dir" ]
    then
        dir="$( getloc "$dir" | inorcmd dirname "$dir" )"
    fi
    builtin cd "$dir"
}

changemark() {
    mark="$1"
    val="$2"
    mrkfl="$( getfl mrk )"

    [ "$mark" = "¬" ] || {
        printf "Overwrite mark [$mark]? (y/N)\nCurrent value: $( grep "^$mark\s" "$mrkfl" | sed 's/^[^ ]*\s*\|\s*$//g' )\nNew value    : $val\n"
        equals "$( readchar )" Y y || return
    }

    gawk -i inplace -v mrkfl="$mark" -v val="$val" '$1 == mrkfl {$2=val}1' "$mrkfl"
}

¬() {
    catfl mrk | while read -r i
    do
        mrk="$( printf "%s" "$i" | awk '{print $1}' )"
        [ "$mrk" = "¬" ] && {
            changemark ¬ "$PWD"
            cd "$( printf "%s" "$i" | awk '{print $2}' | expandpath )"
            return
        }
    done

    printf "Could not find the previous mark.\n"
}

m() {
    mark="$1"

    mrkfl="$( getfl mrk )"

    if [ "$2" ]
    then
        val="$( realpath "$2" )"
    else
        val="$PWD"
    fi

    grep -Eq "$mark\s" "$mrkfl" && { 
        changemark "$mark" "$val"
        return
    }

    printf "%s %s\n" "$mark" "$val" >> "$mrkfl"
}

@() {
    mark="$1"

    catfl mrk | while read -r i
    do
        mrk="$( printf "%s\n" "$i" | awk '{print $1}' )"
        [ "$mrk" = "$mark" ] && {
            val="$( printf "%s\n" "$i" | sed 's/^[^ ]\+\s\+//' | expandpath )"

            if [ -e "$val" ] && [ ! -d "$val" ]
            then
                v "$val"
            elif [ -d "$val" ]
            then
                cd "$( printf "%s\n" "$i" | sed 's/^[^ ]\+\s\+//' | expandpath )"
            else
                printf "Mark has invalid value: [$val]\n"
            fi

            return
        }
    done

    printf "Mark $mark does not exist.\n"
}

eal() {
    if [ "$#" = "1" ]
    then
        empty=""
    else
        empty="\n"
    fi

    for i
    do
        expw="$( where "$i" )"
        if [ -z "$( printf "%s" "$expw" | sed "s/^$i: aliased to .*//" )" ] && [ "$( whereis "$i" )" = "$i:" ]
        then
            printf "%s\n" "$expw" | cut -f 1,2,3 -d ' ' --complement
        else
            printf "$empty"
        fi
    done
}

watchal() {
    expal="$( eal "$1" )"
    shift
    watch "$@" $expal
}

g() {
    [ "$2" ] && { 
        printf "Only one argument is accepted.\n"
        return 1
    }

    [ "$1" ] || {
        cd
        return
    }

    dir="$( getlocall "$1" )"

    if [ -d "$dir" ]
    then
        changemark ¬ "$PWD"
        cd "$dir"
    else
        printf "No such directory.\n"
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
    tmp="$( mktemp )"
    lf -last-dir-path="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$( < "$tmp" )"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

sl() {
    tmp="$( sudo mktemp )"
    sudo lf -last-dir-path="$tmp" "$@" # TODO: Sync config file like in sr().
    [ -f "$tmp" ] && {
        dir="$( sudo cat "$tmp" )"
        sudo rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

r() {
    tmp="$( mktemp )"
    ranger --choosedir="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$( < "$tmp" )"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

sr() {
    # sudo zsh -c "$( declare -f r ); r"
    
    tmp="$( sudo mktemp )"
    sudo ranger --choosedir="$tmp" --confdir="$HOME/.config/ranger" . "$@"
    [ -f "$tmp" ] && {
        dir="$( sudo cat "$tmp" )"
        sudo rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

grl() {
    g "$@" && l
}

gsrl() {
    g "$@" && sl
}

gr() {
    g "$@" && r
}

gsr() {
    g "$@" && sr
}

@rl() {
    @ "$@" && l
}

@srl() {
    @ "$@" && sl
}

@r() {
    @ "$@" && r
}

@sr() {
    @ "$@" && sr
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

    yec="$?"

    (statbarsetavlsyu && statbaravlsyu && statbarset) &!
    # [ -z "$( jobs | grep "$!" )" ] || disown "$!"

    return "$yec"
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

mkcd() {
    mkdir -p "$1" && cd "$1"
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

gcld() {
    fl="$( mktemp )"
    git clone "$@" | tee "$fl"
    dir="$( head -n 1 "$fl" | sed -e "s/^Cloning into '//" -e "s/'...$//" )"
    [ -d "$dir" ] && cd "$dir"
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

gacmc() {
    [ "$#" = 1 ] && {
        git add "$*" && git commit -m "Create $*"
        return
    }

    # git add "$@" && git commit -m "Create $( printf "%s," "$@" | sed 's/,\([^]*\),$/ and \1./' )" # TODO: Does not work, fix. This might be a bug in sed, consider filing a bug report.
    # git add "$@" && git commit -m "Create $( printf "%s, " "$@" | sed 's/, \([^ ]*\), $/ and \1./' )"
    git add "$@" && git commit -m "Create $( printf "%s, " "$@" | sed 's/, \([^ ]*\), $/ and \1/' | sort -n )"
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
        printf "No arguments given.\n"
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

    if [ "$1" = "clean" ] || [ "$1" = "c" ]
    then
        rm -f main.c program
        return
    fi

    gcc main.c -Wall -o program && ./program "$@"
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

# sed -e '/^#/d' -e 's/#.*//' -e 's/\\//g' ~/.echo.shrc

# todo list
