#!/bin/bash
#
# replace covid19 usa country code with one of your choice according to covid19-cli docs -
# https://open-source-software-ph.gitbook.io/covid19-tracker-cli/getting-started/basic-usage#country-tracking
#
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# crontab schedule i use for this:
# 0 10,15 *  * * /path/to/covid.sh

COVID="$(curl -L https://covid19-cli.wareneutron.com/quiet/basic/usa)"
CMD="$(echo -n ${COVID})"

TITLE="covid data"
MESSAGE="${CMD}"
PRIORITY=5
URL="https://url/message?token=slay"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"
