#!/bin/bash
#
# this is an example rclone command. please replace with your own.
#
# this script is meant to be used with backup-notif.sh in /scripts, see that script for crontab example using both scripts
#

rclone copy remote:path/to/data /mnt/backup --rc --rc-addr 192.168.1.123:5572 -v --stats-log-level NOTICE --log-file /home/server-backup/rclone.log
