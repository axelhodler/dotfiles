#!/bin/sh

if [ -f bin/run.sh ];
then
  ./bin/run.sh
fi

if [ -f build.gradle ];
then
  ./gradlew
fi
