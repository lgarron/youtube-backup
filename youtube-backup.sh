#!/bin/bash

if [ "$#" -eq "0" ]
then
	echo "Usage: ./youtube-backup.sh [username]"
	exit
fi

##

if [ ! -d "dl" ]
then
	mkdir "dl"
fi

if [ ! -d "dl" ]
then
	mkdir "vids"
fi

##

node youtube-backup.js "${1}"

##

cd "dl"

cat "../vids/vids.txt" |
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