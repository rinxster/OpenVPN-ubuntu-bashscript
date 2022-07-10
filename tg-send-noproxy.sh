#!/bin/bash
# script for sending TEXT/FILE to Telegram
#
# Usage: bash tg-send.sh "<text>" or "</path/to/file>"
# ..."folder non-exist" errors may be ignored
#
SENDME=$1
TG_BOT_ID=<ID>
TG_CHAT_ID=<ID>
#
# sending text-message
#curl --socks5-basic \
#-X POST https://api.telegram.org/bot$TG_BOT_ID/sendMessage -d chat_id=$TG_CHAT_ID -d \
#text="$SENDME"
#
# sending file-message
cat $SENDME > /tmp/tg-export && \
curl --socks5-basic \
-s -X POST https://api.telegram.org/bot$TG_BOT_ID/sendDocument -F chat_id=$TG_CHAT_ID -F \
document=@$SENDME
#
# cleaning
rm -f /tmp/tg-export
