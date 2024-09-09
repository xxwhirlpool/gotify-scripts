#!/bin/bash

# replace "New+York" in curl URL from wttr.in with your desired country/city/location/etc. make sure to keep format=3 for a one line output in the notification
# more info about wttr.in here https://github.com/chubin/wttr.in#one-line-output
#
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# crontab schedule i use for this:
# 0 * * * * /path/to/weather.sh

WEATHER=$(curl https://wttr.in/New+York?format=3)

TITLE="weather"
MESSAGE="${WEATHER}"
PRIORITY=5
URL="https://gotify.girlonthemoon.xyz/message?token=Apqq2MOk_yLflvH"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"
