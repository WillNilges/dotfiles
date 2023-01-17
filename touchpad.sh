#!/bin/bash
###Purpose: Toggle synaptic touchpad on/off
##Author: Fazle Arefin
##Reference: http://ubuntuforums.org/showthread.php?t=1536305
#xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

TOUCHPADID="SynPS/2 Synaptics TouchPad"   # change this id
SYNSTATE=$(xinput list-props "$TOUCHPADID" | grep "Device Enabled" | grep -Eo '.$') 
if [ $SYNSTATE = 0 ]; then 
xinput set-prop "$TOUCHPADID" "Device Enabled" 1
else
xinput set-prop "$TOUCHPADID" "Device Enabled" 0 
fi
