#!/bin/bash

echo "command start ${RECPATH} ${NAME} `date`" >> /app/logs/command.log

if [ "${1}" = "recordedEndCommand" ]; then
  /post-misskey/post-misskey-linux-amd64 --text "[録画終了]\n${NAME}\n${CHANNELNAME}" >> /app/logs/command.log
  /usr/local/bin/rclone --config /config/rclone/rclone.conf --log-file /app/logs/rclone.log --log-level INFO  move ${RECPATH} EXAMPLE:/rec/epgstation/ >> /app/logs/command.log
  /post-misskey/post-misskey-linux-amd64 --text "[アップロード終了]\n${NAME}\n${CHANNELNAME}" >> /app/logs/command.log
elif [ "${1}" = "recordedStartCommand" ]; then
  /post-misskey/post-misskey-linux-amd64 --text "[録画開始]\n${NAME}\n${CHANNELNAME}" >> /app/logs/command.log
elif [ "${1}" = "recordedPrepRecFailedCommand" ]; then
  /post-misskey/post-misskey-linux-amd64 --text "[録画準備失敗]\n${NAME}\n${CHANNELNAME}\n" >> /app/logs/command.log
fi

