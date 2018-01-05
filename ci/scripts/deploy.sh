#!/bin/ash
set -e -x

### Load env

ls -ltr

tar xfz bins/spring-music-bin-1.0.0.tar.gz
if [ $? != 0 ];
then
    echo "tar Error";
    exit 245;
fi

cd app
if [ $? != 0 ];
then
    echo "cd Error";
    exit 245;
fi

set +x
export TERM=vt100 
cf login -u admin -p admin -a https://api.local.pcfdev.io -o pcfdev-org -s pcfdev-space --skip-ssl-validation
if [ $? != 0 ];
then
    echo "cf dev target - Error";
    exit 245;
fi
set -x

cf push
if [ $? != 0 ];
then
    echo "cf push error"; 
    exit 244;
fi

cf apps | tail -1 | awk '{print $6}' >> ../outputs/dd-$1.txt
CF_TRACE=1 cf apps | tail -1 | awk '{print $6}' >> ../outputs/dd-$1.txt
pwd
ls -la
