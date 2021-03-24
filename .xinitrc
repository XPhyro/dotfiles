# vim: ft=sh

[ -f "$HOME/.Xresources" ] && xrdb -merge -I"$HOME" "$HOME/.Xresources"

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

statbar() {
    sleep 3

    cachedir="$XDG_CACHE_HOME"
    [ -z "$cachedir" ] && cachedir="$HOME/.cache"
    find "$cachedir/statbar" -mindepth 1 -maxdepth 1 -type f | while read -r i
    do
        eval "$( printf "%s" | sed -E 's/^[0-9]+(\.[0-9]+)?_//' )"
    done

    statbarset
}

xdotool key Num_Lock
setxkbtick &

xcompmgr -c -o 0 &
hsetroot

sxhkd &
/usr/lib/notification-daemon-1.0/notification-daemon &
notiflog &
flameshot &
nm-applet &

tpcycle &
clplog &
tglapp -T on -- redshift -l "$( catfl gpsloc )" -t 5800:3900 -g 0.8 -m randr &

openpdfs &
setupaudio &
setupxr &
restart-wallpaper -T on &
statbar &
exec dwm
