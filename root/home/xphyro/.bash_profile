#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export TERMINAL="st"
export _JAVA_AWT_WM_NONREPARENTING=1

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
      exec startx
      #setup-xrr-home
fi

source /home/xphyro/.config/broot/launcher/bash/br
