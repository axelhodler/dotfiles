#!/bin/sh

set -e

if [ -x test-repo ]; then
  rm -rf test-repo
fi

(
  mkdir test-repo
  cd test-repo
  git init --quiet
  cat ../test-repo.gz | gunzip | git fast-import --quiet
  git checkout --quiet master
)
