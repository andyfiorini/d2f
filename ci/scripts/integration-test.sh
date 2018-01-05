#!/usr/bin/env sh
set -e -x

cat dd/dd-$1.txt
if [ $? != 0 ]
then
   echo "Error en integration testing de spring-music";
   exit 240;
fi
