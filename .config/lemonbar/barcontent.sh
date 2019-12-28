#!/bin/sh
Date() { 
	echo "%{F#D9CBBE}$(date)%{F-}"
}
Battery() {
	STATE=$( acpi | awk '{print $4}' | sed 's/,//')
	battery_status="$(acpi -b | awk -F '[[:space:]]+|,' '{ print $3 }')"
	case "$battery_status" in
		'Charging')
			echo " %{F#EABA66}$STATE%{F-}  " ;;
		'Discharging')
			echo " %{F#D93650}$STATE%{F-}  " ;;
		'Full') 
			echo " %{F#00B200}$STATE%{F-}  " 
	esac
}
Disk() {
	echo "%{F#D9CBBE}$(df -h /dev/sda1 --output=avail | grep -v Avail)%{F-}"
}
Memory() {
	echo "%{F#D9CBBE}$(free -t -h | grep Total | awk '{ print $3 }')%{F-}"
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
			OUTPUT="$OUTPUT %{F#D9CBBE}$NAME%{F-}"
		else
			OUTPUT="$OUTPUT %{F#888888}$NAME%{F-}"
		fi
	done
	echo "$OUTPUT "
}

while true; do
	echo "%{B#2e3443}%{r}%{B#4c566a}$(getWs)%{B-}%{B#2e3443}%{c}%{B#4c566a} %{F#D9CBBE}$(getApp)%{F-} %{B-}%{B#2e3443}%{r}%{B#4c566a}$(Disk) $(Memory) $(Battery) $(Date) %{B-}"
	timeout 5s bspc subscribe -c 2 node desktop > /dev/null
done
