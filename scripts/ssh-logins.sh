#!/bin/bash
#
# add the below line to end of /etc/pam.d/sshd
# session optional pam_exec.so /path/to/ssh-logins.sh
#
# sources:
# https://gist.github.com/Pro-Tweaker/1b7153cfef588ad6401c85a5bb97f674
# https://docs.ntfy.sh/examples/#ssh-login-alerts
#
# replace https://url/message?token=slay as needed - URL with your reverse proxied gotify site (https://gotify.net/docs/caddy), token with your app token after you've created it in the web UI for apps (https://gotify.net/docs/pushmsg)
#
# you can do this from multiple machines and direct it to the machine running gotify - just use different applications and subsequently their tokens, and make sure to edit the pam.d/sshd file as noted above

if [ "${PAM_TYPE}" = "open_session" ]; then

TITLE="ssh logins"
MESSAGE="SSH login: ${PAM_USER} from ${PAM_RHOST}"
PRIORITY=5
URL="https://url/message?token=slay"

curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"

fi
