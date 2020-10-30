#!/bin/bash

echo "Starting gaming VM"

#i3-msg [workspace=2:SteamDiscord] move workspace to output HDMI-0
#sleep 5

xrandr --output DP-0 --off
virsh -c qemu:///system start game

sleep 10

while [ "$(virsh -c qemu:///system domstate game)" = "running" ]
do
  sleep 10
done

echo "Done gaming"
xrandr --output DP-0 --auto --right-of HDMI-0
#sleep 2
#i3-msg [workspace=2:SteamDiscord] move workspace to output DP-0

