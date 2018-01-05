#!/usr/bin/env sh
set -e -x

cd application
export JAVA_HOME=`alternatives --list | grep java | head -1 | awk '{print $3}' | sed 's/\/bin\/java//g'`
TERM=vt100 ./gradlew install 
TERM=vt100 ./mvn -f build/poms/*.pom clean package
if [ $? != 0 ]
then
   echo "Error en build de spring-music";
   exit 240;
fi
cd ..
tar cvfz built-app/spring-music-bin-1.0.0.tar.gz application
pwd
ls

