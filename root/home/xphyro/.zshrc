[[ $- != *i* ]] && return

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '$HOME/.zshrc'

FPATH="$HOME/.zsh/completions:$FPATH"
fpath=("$HOME/.zsh/completions" $fpath)
autoload -Uz compinit
compinit
HISTFILE="$HOME/.dotfiles-sensitive/root$HOME/.zsh_history"
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt nomatch autocd extendedglob rmstarsilent
unsetopt beep notify
bindkey -v

# Enable colours and change prompt:
autoload -U colors && colors    # Load colours
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
psprefix=
[ -n "$LF_LEVEL" ] && psprefix="%{$fg[red]%}[$LF_LEVEL] "
PS1="%B$psprefix%{$fg[cyan]%}%~%{$fg[yellow]%}$%{$reset_color%}%b "
setopt autocd       # Automatically cd into typed directory.
# stty stop undef     # Disable ctrl-s to freeze terminal.

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

ca="--color=always"

#
##
### END VARIABLE ###

### BEGIN ALIAS ###
##
#

alias bgd="bg 2> /dev/null && disown"
alias bgq="bg 2> /dev/null && disown && exit"
alias re="builtin r"

alias o="$OPENER"

alias mp="modprobe"
alias mpr="modprobe -r"

alias fck='sudo !!'
alias fuck='sudo $(fc -ln -1)'
alias sudo="nocorrect sudo "
alias sudod="/usr/bin/sudo"

alias diff="colordiff"
alias diffd="meld"
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

alias bat="less"
alias lessr="less -R"

alias ..........="cd ../../../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ........="cd ../../../../../../.."
alias .......="cd ../../../../../.."
alias ......="cd ../../../../.."
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."

alias Q="exit"
alias QQ="exit"
alias QQQ="exit"
alias q="exit"
alias qq="exit"
alias qqq="exit"

alias bash="HISTFILE= bash"
alias sh="HISTFILE= sh -V"

alias cpr="cp -r"
alias mkd="mkdir -p"
alias mvr="mv -r"
alias prM="progress -M"
alias prm="progress -m"
alias rmr="rm -r"

alias cfd="sudo cfdisk"
alias cfdn="sudo cfdisk /dev/nvme0n1"
alias mount="sudo mount"
alias sfd="sudo fdisk"
alias sfdl="sudo fdisk -l | less"

alias dffs="df -h | head -n 1; df -h | grep \\^/dev/ --color=never"
alias dffsw='watch "$(eal dffs)"'
alias du="du -L"
alias dud="du -chx . | sort -h | env less -F +G"

alias compgen="print -rl -- \${(k)aliases} \${(k)functions} \${(k)parameters} \${(k)builtins} \${(k)commands}"

# alias hcgrep="hist | awk '{$1=$2=$3=""; print substr($0,2)}' | grep -i" # TODO: Works as standalone, but alias gives error, fix.
alias cgrep="compgen | grep -i"
alias hgrep="hist | grep -i"
alias hgrepc="hist | grep -iC 3"
alias hgrepi="hist | grep"
alias lalgrep="lal | grep -i"
alias lgrep="l1 | grep -i"
alias llgrep="ll | grep -i"
alias lrgrep="lr | grep -i"
alias ngrep="netstat -tulpn | grep -i"
alias pgrep="ps aux | grep -iE"
alias ppgrep="/usr/bin/pgrep"
alias ygrep="yay -Q | grep -i"
alias zsgrep="cat \$(getfl zshrc) | grep -i"

alias ct="fcrontab -e"
alias sct="sudo fcrontab -e"

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

alias py2="python2 -q"
alias pypy="pypy3 -q"

alias R="R -q"
alias Rs="R -s"
alias mat="matlab &!"

alias b="broot"
alias ce="contexec"
alias me="mapexec"

alias sv="sudo vim"

alias fx="fzfx"

alias mdr="mdv README.md"
alias mdt="mdv TODO.md"

# TODO: For the getfl ones, register files with shorter keys, i.e. \1 where v(.*), and use e.
alias vb="v \$(getfl bashrc)"
alias vc="v config.h"
alias vcd="v config.def.h"
alias ve="v \$(getfl echoshrc)"
alias vg="v .gitignore"
alias vgc="v \$(getfl gitconfig)"
alias viv="v \$(getfl ideavimrc)"
alias vma="v Makefile"
alias vmc="v main.c"
alias vmem="sudo v /sys/power/{mem_sleep,state}"
alias vmim="v \$(getfl mimeapps)"
alias vmt="v main.tex"
alias vs="v \$(getfl sxhkdrc) && killall sxhkd && restart-sxhkd"
alias vv="v \$(getfl vimrc)"
alias vw="v \$(getfl workout)"
alias vx="v \$(getfl xinitrc)"
alias vxr="v \$(getfl xresources)"
alias vz="v \$(getfl zshrc)"
alias vza="v \$(getfl zathurarc)"
alias vzp="v \$(getfl zprofile)"

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
alias ys="yay -S"
alias ysc="yes | yay -Sc"
alias yscc="yes | yay -Scc"
alias yss="yay -Ss"
alias yu="yay -Syu"

alias pacman-autoremove='sudo pacman -Rcns "$(pacman -Qdtq)"'
alias pacman-list='LC_ALL=C pacman -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'
alias yay-autoremove='yay -Rcns "$(yay -Qdtq)"'
alias yay-list='LC_ALL=C yay -Qi | awk "/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}" | sort -h'

alias pip-update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

alias cmsmic="rm -f config.h; make -j12; sudo make install clean"
alias gobi="go build && go install"
alias hsmic="./autogen.sh && ./configure --prefix=/usr && sudo make -j12 install"
alias mi="make -j12; make install"
alias sm="sudo make"
alias smi="sudo make -j12; sudo make install"
alias smic="sudo make -j12; sudo make install clean"
alias smu="sudo make uninstall"

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

alias rs="ka sxhkd 2> /dev/null; setxkb"

alias xc="xclip -se c"
alias xco="xclip -o -se c"
alias xevv="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias xr="xrandr"

alias pmap="sudo pmap"

alias netstat="sudo netstat"
alias netstatt="netstat -tulpn"

alias dhcp="sudo dhcpcd"
alias wpac="sudo rm /run/wpa_supplicant/wlan0; sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf && sudo dhcpcd; until ping -c1 google.com; do sleep 0.5s; done"

alias ping0="ping 127.0.0.1"
alias ping100="ping 192.168.1.100"
alias ping1="ping 192.168.1.1"
alias ping8="ping 8.8.8.8"
alias pingg="ping google.com"
alias pingn="pingnotif 8.8.8.8 google.com &!"

alias stl="speedtestlog"
alias stlp="speedtestlogp | env less +G"

alias myip="curl ipinfo.io/ip && printf '\n'"

alias scp="scp -P 14253"
alias ssh="ssh -p 14253"

alias ka="sudo killall"
alias rfk="sudo rfkill"

alias sc="shellcheck -e SC2188,SC1007,SC2088,SC2086,SC2015,SC2046,SC1003,SC2059"

alias fum="fusermount"
alias mount="sudo mount"
alias rc="sudo rclone"
alias umount="sudo umount"

alias btmon="sudo btmon"

# alias tlmgr="tllocalmgr"
alias btctl="bluetoothctl"

alias a2dpb="a2dp $bt"
alias a2dpbe="a2dp $bt && exit"
alias a2dpm="a2dp $mpow"
alias a2dpme="a2dp $mpow && exit"
alias am="alsamixer"
alias lpbkoff="pactl unload-module module-loopback"
alias lpbkon="pactl load-module module-loopback latency_msec=1"

alias ga.="git add ."
alias ga="git add"
alias gacm="git add . && gcm"
alias gau.="git add -u"
alias gb="git branch"
alias gba="git branch -a"
alias gbav="git branch -av"
alias gbd="git branch -d"
alias gbu="git branch -u"
alias gbv="git branch -v"
alias gbva="git branch -av"
alias gc="git commit"
alias gca="git commit --amend"
alias gcdl="git -c color.status=always commit --dry-run | env less -r"
alias gcme="git commit --allow-empty -m"
alias gco="git checkout"
alias gcod="git checkout -d"
alias gcoo="git checkout --orphan"
alias gd="git diff"
alias gdas="git diff Assets/Scripts"
alias gdc="git diff --cached"
alias gdw="git diff --color=always --word-diff"
alias gf="git fetch"
alias gl="git log"
alias glp="git log --color=always --follow -p"
alias glps="git log --color=always --follow -p --stat"
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
alias gpsq="git push && exit"
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
alias gress1="git reset --soft HEAD~1"
alias gress="git reset --soft"
alias grest="git restore"
alias grests.="git restore --staged ."
alias grests="git restore --staged"
alias grm="git rm"
alias grmc="git rm --cached"
alias gs="git status"
alias gsh="git show --color=always"
alias gsl="git shortlog"
alias gsls="git shortlog -s"
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

alias w="watson"
alias we="watson edit"
alias wl="watson log"
alias woff="watson stop"
alias won="watson start"
alias ws="watson status"

alias ghost="env gs"

alias ltxs="latexstp --shell-escape"
alias ltxso="ltxs -of --shell-escape main"
alias ltxsoq="ltxso && exit"
alias vm="latexstp --shell-escape main"

alias vpn="sudo protonvpn"

alias vpnc="vpn c"
alias vpncc="vpn c --cc ch"
alias vpncd="vpn c --cc de"
alias vpncf="vpn c -f"
alias vpncn="vpn c --cc nl"
alias vpnct="vpn c --cc tr"
alias vpnd="vpn d"
alias vpnr="vpn r"
alias vpns="vpn s"

alias vpnccq="vpn c --cc ch && exit"
alias vpncdq="vpn c --cc de && exit"
alias vpncfq="vpn c -f && exit"
alias vpncnq="vpn c --cc nl && exit"
alias vpncq="vpnc --cc && exit"
alias vpndq="vpn d && exit"
alias vpnrq="vpn r && exit"
alias vpnsq="vpn s && exit"

alias h="hugo --path-warnings"
alias hd="h -D"
alias hs="h server"
alias hsd="hs -D"

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
alias rdfdow='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$(mktemp /tmp/rdfind-rdfdow-p-log.XXXXXX )" -dryrun false ~/downloads/p; echo; rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks false -deleteduplicates true -outputname "$( mktemp /tmp/rdfind-rdfdow-log.XXXXXX)" -dryrun false ~/downloads'
alias rdfl='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$(mktemp /tmp/rdfind-rdfl-log.XXXXXX)" -dryrun false'
alias rdfp='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks true -deleteduplicates true -outputname "$(mktemp /tmp/rdfind-rdfp-log.XXXXXX)" -dryrun false ~/archive/p/p'
alias rdfr='rdfind -minsize 1 -removeidentinode false -makehardlinks false -makesymlinks false -deleteduplicates true -outputname "$(mktemp /tmp/rdfind-rdfr-log.XXXXXX)" -dryrun false'

alias syncp="rdfdow && symlinks -cr ~/downloads/p/ && rsync -abviuzP --remove-source-files ~/downloads/p/ ~/archive/p/p/ && rdfp"

alias w2="waifu2x-converter-cpp"
alias ycmgen="~/repo/YCM-Generator/config_gen.py"

alias ddad="dragon-drag-and-drop -a -x"

alias tetris="autoload -Uz tetriscurses && tetriscurses"

alias antigen="echo n | antigen-hs-setup"

#
##
### END ALIAS ###

### BEGIN FUNCTION ###
##
#

fork() {
    ("$@") &!
}

kill2() {
    ps aux | grep -iE "$1" | awk '{print $2}' | xargs -rn 1 kill "${@:2}"
}

hist() {
    [[ "$@" ]] && fc -li -$@ || fc -li 0
}

cd() {
    dir="$1"
    if [ -n "$dir" ]
    then
        [ ! -d "$dir" ] && dir="$(getloc "$dir" | inorcmd dirname "$dir")"
    else
        dir="$HOME"
    fi
    cm ¬ "$PWD"
    builtin cd "$dir"
}

cdw() {
    cd "$(where "$1")"
}

l() {
    if [ "$#" -eq 0 ]; then
        less -R
    elif [ -e "$1" ]; then
        previewtext "$@" | less -R
    else
        eval "$*" | less -R
    fi
}

c() {
    if [ "$#" -eq 0 ]; then
        return 0
    elif [ -e "$1" ]; then
        previewtext "$@"
    else
        whereis -b "$@" | awk '{if (NF > 1) print $2}' | xargs -d '\n' -r strings --
    fi
}

rgfi() {
    rg -L --files -g "$*" 2> /dev/null
}

rgf() {
    rg -L --files --iglob "$*" 2> /dev/null
}

rggi() {
    rg -L --files -g "*$**" 2> /dev/null
}

rgg() {
    rg -L --files --iglob "*$**" 2> /dev/null
}

¬() {
    # TODO: Make the mark '¬' not shared between terminals, but still saved after terminal is closed. Then, load the save only at initialisation. Before exiting, cp -f "$somedir/$$" "$somedir/0" and when initialising, cp "$somedir/0" "$somedir/$$" can respectively be used to save and load.
    # TODO: This fails to work correctly if there is whitespace in the path.
    catfl mrk | while IFS= read -r i
    do
        mrk="$(printf "%s" "$i" | awk '{print $1}')"
        [ "$mrk" = "¬" ] && {
            cm ¬ "$PWD"
            cd "$(printf "%s" "$i" | awk '{print $2}' | expandpath)"
            return
        }
    done

    printf "Could not find the previous mark.\n"
}

@() {
    dir="$(_@ "$@")" && [ -n "$dir" ] && cd "$dir"
}

@i() {
    dir="$(_@i "$@")" && [ -n "$dir" ] && cd "$dir"
}

g() {
    dir="$(_g "$@")" && [ -n "$dir" ] && cd "$dir"
}

gi() {
    dir="$(_gi "$@")" && [ -n "$dir" ] && cd "$dir"
}

fd() {
    dir="$(env _fd "$@")" && [ -n "$dir" ] && cd "$dir"
}

ff() {
    dir="$(_ff "$@")" && [ -n "$dir" ] && cd "$dir"
}

eal() {
    expw="$(where "$1")"
    if [ -z "$(printf "%s" "$expw" | sed "s/^$1: aliased to .*//" )" ] && [ "$( whereis "$1")" = "$1:" ]
    then
        printf "%s" "$expw" | cut -f 1,2,3 -d ' ' --complement | perl -p -e 'chomp if eof'
    else
        return 1
    fi

    printf " %s" "${@:2}"
    printf "\n"
}

# TODO: Merge @r, gr and r into r. Check whether the key exists in @, then g, then fallback to plain r. sr should stay the same.
r() {
    tmp="$(mktemp)"
    # TODO: lfrun basically disables the asynchronouity, maybe don't use lfrun or have an alternate function where lf is used instead of lfrun. Maybe try to make lfrun more asynchronous?
    lfrun -last-dir-path="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$(< "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

sr() {
    tmp="$(sudo mktemp)"
    # TODO: lfrun basically disables the asynchronouity, maybe don't use lfrun or have an alternate function where lf is used instead of lfrun. Maybe try to make lfrun more asynchronous?
    sudo lfrun -last-dir-path="$tmp" -config="$XDG_CONFIG_HOME/lf/lfrc" "$@"
    [ -f "$tmp" ] && {
        dir="$(sudo cat "$tmp")"
        sudo rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

ra() {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    [ -f "$tmp" ] && {
        dir="$(< "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

sra() {
    tmp="$(sudo mktemp)"
    sudo ranger --choosedir="$tmp" --confdir="$XDG_CONFIG_HOME/ranger" . "$@"
    [ -f "$tmp" ] && {
        dir="$(sudo cat "$tmp")"
        sudo rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$PWD" ] && cd "$dir"
    }
}

gr() {
    g "${@:1:1}" && r "${@:2}"
}

@r() {
    @ "${@:1:1}" && r "${@:2}"
}

@l() {
    @ "${@:1:1}" && l "${@:2}"
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
    elif [ "$#" -ne 0 ]
    then
        yay -S "$@"
    else
        yay -Syu
    fi

    yec="$?"

    {statbarsetavlsyu && statbaravlsyu && statbarset;} &!

    return "$yec"
}

z() {
    [ "$#" -eq 0 ] && return

    if [ "$#" -eq 1 ]
    then
        zathura "$@" &!
    else
        tabbed -c zathura "$@" -e &!
    fi
}

to() {
    for i
    do
        [ -e "$i" ] && {
            touch "$i"
            continue
        }
        dir="$(dirname "$i")"
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
        tox "$i" && vim "$i"
    done
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

py() {
    if [ "$#" -eq 0 ]
    then
        ptpython
    else
        python "$@"
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

gcl() {
    git clone "$@" && cd "$(find . -mindepth 1 -maxdepth 1 -type d -printf "%T@ %p\n" | sort -n | cut -d ' ' -f 2 | tail -n 1)"
}

gcm() {
    if [ "$#" -eq 1 ]
    then
        git commit -m "$1"
    else
        git commit -m "$1" -m "${@:2}"
    fi
}

gacmc() {
    gacma Create "$@"
}

gacmrm() {
    gacma Remove "$@"
}

gacmu() {
    gacma Update "$@"
}

gacmr() {
    gacma Refactor "$@"
}

gacmw() {
    gacma Rewrite "$@"
}

gacmf() {
    gacma Format "$@"
}

gacmo() {
    gacma Optimise "$@"
}

gacmt() {
    plural=""
    [ "$#" -gt 1 ] && plural="s"
    gacma "Add TODO comment$plural in" "$@"
}

gacmut() {
    if [ -f "TODO" ]
    then
        gacmu "TODO"
    else
        gacmu "TODO.md"
    fi
}

gacmur() {
    if [ -f "README" ]
    then
        gacmu "README"
    else
        gacmu "README.md"
    fi
}

greshh() {
    git reset --hard "HEAD~$1"
}

gressh() {
    git reset --soft "HEAD~$1"
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
bindkey '^_'  history-incremental-search-backward

autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

#
##
### END KEYMAP ###

# source ~/.autojump/share/autojump/autojump.zsh
source ~/.zsh/antigen-hs/init.zsh
source ~/repo/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# oldf="$(eal f)"
# eval "$(fasd --init auto)"
# alias f="$oldf"
# unset oldf

# sed -e '/^#/d' -e 's/#.*//' -e 's/\\//g' ~/.echo.shrc

date +"%s" >> "$(getfl terminallog)"

# [ -n "$XDG_CURRENT_DESKTOP" ] && [ -z "$LF_LEVEL" ] && r
