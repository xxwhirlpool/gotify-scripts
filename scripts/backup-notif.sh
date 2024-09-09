#!/bin/bash
# 
# this script is meant to be used with rclone-server.sh in /scripts, see that script for rclone example command (replace with your own!)
# 
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# crontab schedule i use for this:
# 0 0 * * * /path/to/rclone-server.sh && /path/to/backup-notif.sh

TITLE="server backups"
MESSAGE="server backup complete"
PRIORITY=5
URL="https://url/message?token=slay"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"
