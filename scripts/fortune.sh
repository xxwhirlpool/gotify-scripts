#!/bin/bash

# install fortune-mod according to docs (https://github.com/shlomif/fortune-mod?tab=readme-ov-file#installation)
# install additional packages for fortune data (like the quotes and shit) - for ubuntu just run this:
# apt-cache search "^fortunes"
# and then install desired packages. on my distro i had the following available and installed them - fortunes-debian-hints fortunes
#
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# crontab schedule i use for this:
# */10 * * * * /path/to/fortune.sh

FORTUNE="$(fortune linux)"
CMD="$(echo -n ${FORTUNE})"

TITLE="fortune!"
MESSAGE="${CMD}"
PRIORITY=5
URL="https://url/message?token=slay"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"
