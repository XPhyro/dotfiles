#!/usr/bin/env sh
# Shebang exists to enable vim syntax highlighting.

xrdb -merge -I$HOME ~/.Xresources
# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # does not work for some reason

setupxr() {
    sleep 0.5
    xrh
}

setupaudio() {
    sleep 2
    pulseaudio --start
}


openpdfs() {
    sleep 2.5

    find ~/documents/music/guitar/in-progress ~/documents/ass -mindepth 1 -name "*.pdf" | sort -dfi | while read -r i
    do
        xph-open "$i" &
        sleep 0.1
    done
}

xdotool key Num_Lock
setxkbtick &

# [ "$( ps aux | grep -E "^xphyro.+tty1.+dwm$" | grep -v grep )" ] && {
#     startplasma-x11
#     exit
# }

xcompmgr -c -o 0 &
hsetroot

sxhkd &
/usr/lib/notification-daemon-1.0/notification-daemon &
notiflog &
flameshot &
nm-applet &

tpcycle &
clplog &
statbartick &
syncmailtick &
redshift -l "$( catfl gpsloc )" -t 5800:3900 -g 0.8 -m randr &

openpdfs &
setupaudio &
setupxr &
restart-wallpaper &
exec dwm
