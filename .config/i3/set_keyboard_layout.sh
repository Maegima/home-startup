#!/bin/bash
layouts="$@ $1"
layout=`setxkbmap -query | grep -oP 'layout: \s*\K(\w+)'`

echo $layouts

state=0
for l in $layouts; do
  echo $state $l
  if [ "$state" == "0" ] && [ "$layout" == "$l" ] ; then
    state=1
  elif [[ "$state" == "1" ]] ; then
    setxkbmap -layout $l
    echo "set to $l"
    exit 0
  fi
done
exit 1
