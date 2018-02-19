#!/bin/sh

if [ -f stack.yaml ];
then
  stack repl <<< test
fi

if [ -f package.json ] && [ ! -f build.gradle ];
then
  npm test
fi

if [ -f build.gradle ];
then
  ./gradlew test
fi

if [ -f pom.xml ];
then
  mvn test
fi
