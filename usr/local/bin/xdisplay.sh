#!/bin/bash
#
# This script toggles the extended monitor outputs if something is connected
#
# your notebook monitor
DEFAULT_OUTPUT='LVDS1'

# outputs to toggle if connected
OUTPUTS='VGA1'

# get info from xrandr
XRANDR=`xrandr`

EXECUTE=""

for CURRENT in $OUTPUTS
do
        if [[ $XRANDR == *$CURRENT\ connected*  ]] # is connected
        then
                EXECUTE+="--output $CURRENT --auto --right-of $DEFAULT_OUTPUT "
        else # make sure disconnected outputs are off
                EXECUTE+="--output $CURRENT --off "
        fi
done

xrandr --output $DEFAULT_OUTPUT --auto --preferred --primary $EXECUTE
xset -b
#xrandr --output HDMI1 --auto --output VGA1 --auto --right-of HDMI1 --output LVDS1 --off
