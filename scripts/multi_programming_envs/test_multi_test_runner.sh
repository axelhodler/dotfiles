#!/bin/sh

#set -e

flunk() {
  echo FAIL: $*
  exit 1
}

(
  cd nodejs
  sh ../multi_test_runner.sh > output 2>&1
  [ `cat output | grep -c "npm test"` == 1 ] || flunk "npm test was not invoked"
  rm output
)
