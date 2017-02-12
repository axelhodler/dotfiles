#!/bin/sh

set -e

flunk() {
  echo FAIL: $*
  exit 1
}

(
  cd nodejs
  sh ../multi_test_runner.sh > output 2>&1
  [ `cat output | grep --count "npm test"` == 1 ] || flunk "npm test was not invoked"
  rm output
)

(
  cd maven
  sh ../multi_test_runner.sh > output 2>&1
  [ `cat output | grep --count "npm test"` == 0 ] || flunk "npm test should not have been invoked in a java project"
  rm output
)

(
  cd stack
  sh ../multi_test_runner.sh > output 2>&1
  [ `cat output | grep --count "Leaving GHCi"` == 1 ] || flunk "stack was not invoked"
  [ `cat output | grep --count "Variable not in scope: test"` == 1 ] || flunk "test was not invoked"
  rm output
)
