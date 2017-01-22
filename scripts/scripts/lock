#!/bin/bash

scrot="/tmp/scrot.png"

scrot "$scrot"
convert "$scrot" -scale 10% -scale 1000% "$scrot"
i3lock -u -i "$scrot"

while getopts "s" option
do
  case $option in
    s)
      sudo pm-suspend
      exit
      ;;
  esac
done
