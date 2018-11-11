#!/bin/sh

if [ -f stack.yaml ];
then
  stack repl <<< test
fi

if [ -f package.json ] && [ ! -f build.gradle ] && [ ! -f build.gradle.kts ];
then
  npm test
fi

if [ -f build.gradle ] || [ -f build.gradle.kts ];
then
  ./gradlew test
fi

if [ -f pom.xml ];
then
  mvn test
fi
