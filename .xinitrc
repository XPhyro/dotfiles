xrdb -merge -I$HOME ~/.Xresources
# [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # does not work for some reason

setupxr() {
    sleep 0.5s
    xrh
}

setupaudio() {
    sleep 2s
    pulseaudio --start
}

xdotool key Num_Lock
setxkb

[ "$( ps aux | grep -E "^xphyro.+tty1.+dwm$" | grep -v grep )" = "" ] || {
    startplasma-x11
    exit
}

sxhkd &
bluetoothctl power on &
/usr/lib/notification-daemon-1.0/notification-daemon &
notiflog &
flameshot &
nm-applet &
sudo crond &

tpcycle &
clplog &
statbartick &
syncmailtick &
dotfilesbaktick &
dotfilesbaktick-sensitive &
redshift -l "$( catfl gpsloc )" &

setupaudio &
setupxr &
exec dwm
