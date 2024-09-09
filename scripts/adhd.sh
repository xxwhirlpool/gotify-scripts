#!/bin/bash
#
# yes i set up a god damn gotify script to remind me every 15 minutes to go do the shit i need to do. it's bad for me
#
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# crontab schedule i use for this:
# */15 * * * * /path/to/adhd.sh

TITLE="ADHD REMINDERS"
MESSAGE="\ud83e\udef5 do your shit"
PRIORITY=5
URL="https://url/message?token=slay"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"
