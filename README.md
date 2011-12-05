# youtube-backup

I feel much better trusting "the cloud" if I know that I have a backup of the impartant data when things god bad.
YouTube allows you to download videos you've uploaded. This allows you to back up you uploaded videos at near-full quality with excellent compression.

There is an API to provide a list of your public videos, but it only serves at most 50 videos at a time. So I wrote a simple script to pull the full list, and another to use it to backup all the vidoes of a given YouTube user ID.

## Dependencies
- [node.js](http://nodejs.org/)
- [youtube-dl](http://rg3.github.com/youtube-dl/)

## Details
- Only works for publicly searchable vidoes.