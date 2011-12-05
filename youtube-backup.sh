#!/bin/bash

## Script parameters

if [ "$#" -lt "2" ]
then
	echo "Usage: ./youtube-backup.sh [username] [backup directory]"
	exit
fi

USERNAME="${1}"
BACKUP_DIR="${2}"

## Ensure the needed dirs exist.

if [ ! -d "${BACKUP_DIR}" ]
then
	mkdir "${BACKUP_DIR}"
fi

if [ ! -d "vids" ]
then
	mkdir "vids"
fi

## Download video list.

node youtube-backup.js "${USERNAME}"

## Download videos.

VIDS_FILE="${PWD}/vids/vids.txt"

cd "${BACKUP_DIR}"

cat "${VIDS_FILE}" |
while read ID
do
  CURRENT="`ls | grep -e "${ID}" | wc -l`"
  if [ "$CURRENT" -eq "0" ]
  then
    youtube-dl -t "www.youtube.com/watch?v=${ID}"
  fi
done