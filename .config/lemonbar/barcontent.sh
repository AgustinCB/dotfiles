#!/bin/sh
Date() { 
	echo $(date)
}
Battery() {
	STATE=$( acpi | awk '{print $4}' | sed 's/,//')
	battery_status="$(acpi -b | awk -F '[[:space:]]+|,' '{ print $3 }')"
	case "$battery_status" in
		'Charging')
			echo " %{F#EA7866}$STATE  " ;;
		'Discharging')
			echo " %{F#CE6864}$STATE  " ;;
		'Full') 
			echo " %{F#00FF00}$STATE  " 
	esac
}
Disk() {
	echo "%{F#D9CBBE}$(df -h /dev/sda1 --output=avail | grep -v Avail)"
}
Memory() {
	echo "%{F#D9CBBE}$(free -t -h | grep Total | awk '{ print $3 }')"
}
getApp() {
  app=$(ps -e | grep $(xdotool getwindowpid $(xdotool getwindowfocus)) | grep -v grep | awk '{print $4}')
  case $app in
	  st|xst|urxvt) echo ">_";;
	  "") echo "desktop";;
	  *) echo "$app";;
 esac
}

getWs() {
	OUTPUT="%{l}"
	FOCUSED_DESKTOP=$(bspc wm --dump-state | jq ".monitors[0].focusedDesktopId")
	for i in $(seq 0 9); do
		ID=$(bspc wm --dump-state | jq ".monitors[0].desktops[$i].id")
		NAME=$(bspc wm --dump-state | jq -r ".monitors[0].desktops[$i].name")
		if [ "$ID" -eq "$FOCUSED_DESKTOP" ]; then
			OUTPUT="$OUTPUT %{F#D9CBBE}$NAME"
		else
			OUTPUT="$OUTPUT %{F#888888}$NAME"
		fi
	done
	echo "$OUTPUT"
}

while true; do
	echo "%{B#2e3443}$(getWs)%{c}%{F#D9CBBE}$(getApp)%{r}%{F#FECC6D} $(Disk) $(Memory) $(Battery) %{F#ffffff}$(Date) "
	timeout 5s bspc subscribe -c 2 node desktop > /dev/null
done
