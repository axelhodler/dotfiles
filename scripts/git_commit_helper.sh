#!/bin/bash

MAX_CHARACTERS=50

if [[ -z "$1" ]]
then
  echo "No commit message supplied. Usage: gc commitmessage"
  exit 1
fi

commit_msg="$@"

branchname=$(git rev-parse --abbrev-ref HEAD)

# if the branchname contains a "/" we suspect a ticketid after it
if [[ $branchname == *"/"* ]]
then
  ticketid=$(echo $branchname | cut -f2 -d"/" | cut -d "_" -f1)
  if [[ $ticketid == *"-"* ]] # if it does not contain a - its probably ot a ticket
  then
    commit_msg="$ticketid: $commit_msg"
  fi
fi

# if the branchname IS the ticketname and its not the first commit
if [[ $branchname == [A-Z]* ]] && ! [[ $branchname == "HEAD" ]]
then
   commit_msg="$branchname: $commit_msg"
fi

# check if correct commit message length is used
used_characters=$(printf "$commit_msg" | wc -c)

if [ "$used_characters" -le "$MAX_CHARACTERS" ]
then
  git commit -m "$commit_msg"
else
  chars_over_max=$(expr $used_characters - $MAX_CHARACTERS)
  bold=$(tput bold)
  normal=$(tput sgr0)
  printf "Commit message contains ${bold}[$chars_over_max]${normal} chars too much.\nPlease choose a shorter message:\n"
  fine_part=${commit_msg:0:$MAX_CHARACTERS}
  bad_part=${commit_msg:$MAX_CHARACTERS}
  printf "$fine_part${bold}$bad_part${normal}\n"
fi

~/devel/github/axelhodler/dotfiles/scripts/git_status_helper.sh
