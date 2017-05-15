#!/bin/bash

clear
pandoc -f markdown -s "$1" > "$1".html
lynx --dump "$1".html
rm "$1".html
dir=$(dirname $1)

while true
do
  change=$(inotifywait -e close_write,moved_to,create -q $dir)
  change=${change#./ * }
  clear
  pandoc -f markdown -s "$1" > "$1".html;
  lynx -dump "$1".html;
  rm "$1".html;
  sleep 2;
done;
