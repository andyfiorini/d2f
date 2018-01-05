#!/usr/bin/env sh
set -e -x

tar xvfz bins/spring-music-bin-1.0.0.tar.gz
cd app
export JAVA_HOME=`alternatives --list | grep java | head -1 | awk '{print $3}' | sed 's/\/bin\/java//g'`
TERM=vt100 ./gradlew test
if [ $? != 0 ]
then
   echo "Error en unit testing de spring-music";
   exit 240;
fi
cd ..
pwd
ls

