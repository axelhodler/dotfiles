#!/bin/sh

if [ -f package.json ];
then
  npm test
fi
