#!/usr/bin/env sh
set -e -x

APP_URL=`cat dd/dd-$1.txt | tail -1`;

chromium-browser \
  --disable-background-networking --disable-default-apps --disable-extensions  --disable-gpu  --disable-sync  --disable-translate  --headless  --hide-scrollbars  --metrics-recording-only  --mute-audio  --no-first-run  --safebrowsing-disable-auto-update --enable-logging --v=10000 --dump-dom https://$APP_URL --no-sandbox

