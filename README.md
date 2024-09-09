# gotify-scripts
simple gotify notification scripts by me

in no way are these advanced enough to really justify sharing them. anyone could come up with these. just thought i'd share.

each script has comments showing how to install the required commands/utilities used in the scripts, plus the cron schedule i use for it

## more info

i use [gotify-desktop](https://github.com/desbma/gotify-desktop) to get notifications on my system so i don't have to keep the gotify web client open 24/7 and i don't check my phone enough for me to see the notifications exclusively going there.

gotify-desktop is fantastic and easy to set up, set it and forget it kinda thing after building the cargo rust stuff idk how that works but i just installed rust followed the commands on gotify-rust readme and it worked

debug message content of scripts by reading the [expanded bash script example on the gotify docs](https://gotify.net/docs/more-pushmsg)

also gotify-desktop's config example shows you can use the beep command to send an audio alert with your notification. beep didn't work for me so i replaced it with paplay as such:
```bash
[action]
on_msg_command = "/usr/bin/paplay /usr/share/sounds/freedesktop/stereo/bell.oga"
```
you can presumably use any audio file you want
