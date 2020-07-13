#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar
killall xfce4-panel
killall nm-applet

# Wait until the processes have been shut down

while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c /home/will/.config/polybar/config/example example

xfce4-panel --disable-wm-check

nm-applet

