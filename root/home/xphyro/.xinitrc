# vim: ft=sh

[ -f "$HOME/.Xresources" ] && xrdb -merge -I"$HOME" "$HOME/.Xresources"

setupxr() {
    sleep 1.0
    xrh
}

opendocs() {
    sleep 2.5

    find ~/documents/music/guitar/in-progress ~/documents/ass -mindepth 1 -name "*.pdf" | sort -dfi | while read -r i
    do
        xph-open "$i" &
        sleep 0.1
    done

    firefox 'https://en.wikipedia.org/wiki/Special:Random' &

    fl="$(catfl mrk | grep "^¬")"
    st -d "${fl#"¬ "}" # make this into a more comprehensive framework
}

statbar() {
    sleep 3

    find "$(getloc statbar)" -mindepth 1 -maxdepth 1 -type f | while read -r i
    do
        eval "$(printf "%s" | sed -E 's/^[0-9]+(\.[0-9]+)?_//')"
    done

    statbarset
    restart-wallpaper -aT on
}

tglapp -c

xdotool key Num_Lock
setxkbtick &

tglapp -aT on -- compton &
hsetroot

setxkb
restart-sxhkd &
dunst &
notiflog &
flameshot &
# nm-applet &
tglapp -aT on -k syncmailtick -- syncmailtick 120 &

tpcycle &
clplog &
tglapp -aT on -- redshift -l "$(catfl gpsloc)" -t 5800:3900 -g 0.8 -m randr &

opendocs &
# tglapp -T on -- steam &
setupxr &
statbar &
exec dwm
