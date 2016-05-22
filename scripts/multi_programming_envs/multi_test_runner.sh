#!/bin/sh

set -v

if [ -f package.json ];
then
  npm test
fi
