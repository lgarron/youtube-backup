# youtube-backup

I feel much better trusting "the cloud" if I know that I have a backup of the impartant data when things god bad.
YouTube allows you to download videos you've uploaded, which allows you to back up your uploaded videos at near-full quality with excellent compression.

There is an API to provide a list of your public videos, but it only serves at most 50 videos at a time. So I wrote a simple script to pull the full list, and another to use it to backup all the videos of a given YouTube user ID.

## Dependencies
- [node.js](http://nodejs.org/)
- [youtube-dl](http://rg3.github.com/youtube-dl/)

## Details
- Only works for publicly searchable videos. (If you have any private videos, you need to log in to access them, so you'd have to do that through the web interface. Since almost all my videos are public, I'm unlikely to add support here.)