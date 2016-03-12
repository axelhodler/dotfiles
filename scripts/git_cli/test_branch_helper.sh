#!/bin/sh

set -e

sh fixture.sh

flunk() {
  echo FAIL: $*
  exit 1
}

(
  cd test-repo
  [ `git branch | wc -l` == "3" ] || flunk "Didn't get expected no of output lines"
  git branch -d b_branch --quiet
  [ `git branch | wc -l` == "2" ] || flunk "No branch was deleted"
  [ `git branch | grep b_branch | wc -l` == "0" ] || flunk "Specified branch was not deleted"
)

sh fixture.sh

(
  cd test-repo
  sh ../git_branch_del.sh 1
  [ `git branch | wc -l` == "2" ] || flunk "No branch was deleted"
  [ `git branch | grep b_branch | wc -l` == "0" ] || flunk "Specified branch was not deleted"
)

sh fixture.sh

(
  cd test-repo
  sh ../git_branch_del.sh 0
  [ `git branch | grep a_branch | wc -l` == "0" ] || flunk "Specified branch was not deleted"
)
