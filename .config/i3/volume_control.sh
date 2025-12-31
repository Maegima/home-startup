#!/bin/bash
volumefifo=/tmp/volume_control
while [[ $# -gt 0 ]]; do
  case $1 in
    -s|--start)    op=start ; shift ;;
    -m|--mute)     op=mute  ; shift ;;
    -i|--increase) op=plus  ; value=$2 ; shift ; shift ;;
    -d|--decrease) op=minus ; value=$2 ; shift ; shift ;;
    -*|--*) echo "Unknown options '$1'"; shift ;;
    *) echo "Invalid option '$1'"      ; shift ;;
  esac
done

function start() {
  echo "starting"
  mkfifo $volumefifo
  tail -f $volumefifo | xob
}

function get_status() {
  [ "$(pamixer --get-mute)" == "true" ] && mute="!"
  echo $(pamixer --get-volume)$mute
}

function plus() {
  paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
  pamixer --increase $1
  get_status >> $volumefifo
}

function minus() {
  paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
  pamixer --decrease $1
  get_status >> $volumefifo
}

function mute() {
  pamixer --toggle-mute
  get_status >> $volumefifo
}

case $op in
  start) start        ;;
  mute)  mute         ;;
  plus)  plus $value  ;;
  minus) minus $value ;;
esac
