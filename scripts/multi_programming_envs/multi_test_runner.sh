#!/bin/sh

if [ -f stack.yaml ];
then
  stack repl <<< test
fi

if [ -f package.json ] && [ ! -f build.gradle ] && [ ! -f build.gradle.kts ];
then
  echo "Recognizing npm project, running npm test"
  npm test
fi

if [ -f build.gradle ] || [ -f build.gradle.kts ];
then
  echo "Recognizing gradle project, running ./gradlew test"
  ./gradlew test
fi

if [ -f pom.xml ];
then
  echo "Recognizing maven project, running mvn test"
  mvn test
fi
