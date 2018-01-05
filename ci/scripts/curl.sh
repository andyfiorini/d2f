#!/usr/bin/env ash
set -e -x

APP_URL=`cat dd/dd-$1.txt | tail -1`;

### Load env
curl -vvv -k https://$APP_URL
if [ $? != 0 ];
then
    echo "Curl Error"; 
    exit 244;
fi
