#!/bin/bash

node youtube-backup.js

cd "dl"

cat "../vids.txt" |
while read ID
do
  if [ ! -f "dl/${ID}" ];
  then
  	CURRENT="`ls | grep -e "${ID}" | wc -l`"
  	if [ "$CURRENT" -eq "0" ]
  	then
  		youtube-dl -t "www.youtube.com/watch?v=${ID}"
  	fi
  fi
done