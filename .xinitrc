#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load key mappings
if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

# Update x resources database
if [ -f $HOME/.Xresources ]; then
  xrdb -merge ~/.Xresources
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# exec startfluxbox

exec awesomewm
