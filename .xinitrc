[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setupxr() {
    sleep 0.2
    xr-home
}

xdotool key Num_Lock
setxkbmap -option "caps:escape"
xmodmap -e "keycode 9 = Caps_Lock"
xset -r 9
xset r rate 250 40

sxhkd &
pulseaudio --start &
bluetoothctl power on &
/usr/lib/notification-daemon-1.0/notification-daemon &
flameshot &
sudo crond &

tpcycle
clplog &
statbartick &
dotfilesbaktick &
dotfilesbaktick-sensitive &
redshift -l "$( catfl gpsloc )" &

setupxr &

session=${1:-dwm}

case $session in
    dwm                 ) exec dwm;;
    i3|i3wm             ) exec i3;;
    kde                 ) exec startplasma-x11;;
    xfce|xfce4          ) exec startxfce4;;
    # No known session, try to run it as command
    *                   ) exec $1;;
esac
