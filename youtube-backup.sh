#!/bin/bash

# ./vids.js

cd "dl"

cat "../vids.txt" |
while read ID
do
  if [ ! -f "dl/${ID}" ];
  then
  	CURRENT="`ls | grep "${ID}" | wc -l`"
  	if [ "$CURRENT" -eq "0" ]
  	then
  		youtube-dl -t "${ID}"
  	fi
  fi
done