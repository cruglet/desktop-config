#!/bin/sh

get_option() {
  hyprctl getoption decoration:"$1" | awk 'NR==1{print $2}'
}

set_option() {
  hyprctl --batch "\
    keyword decoration:active_opacity $1;\
    keyword decoration:inactive_opacity $1"
  exit
}

active_opacity=$(get_option active_opacity)
inactive_opacity=$(get_option inactive_opacity)

if [ "$active_opacity" = "1.000000" ] && [ "$inactive_opacity" = "1.000000" ]; then
  set_option 0
else
  set_option 1
fi
