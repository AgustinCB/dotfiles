#!/bin/sh
#script that kills all running bar scripts & bars and reexecutes them
killall -q lemonbar 
killall -q sleep
pkill -f $HOME/.config/lemonbar/barcontent.sh 
$HOME/.config/lemonbar/barcontent.sh	  | lemonbar -f "Liberation Mono" -g 1844x25+38+15 &
