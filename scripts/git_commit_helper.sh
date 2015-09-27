#!/bin/bash

MAX_CHARACTERS=50

commit_msg="$@"

branchname=$(git rev-parse --abbrev-ref HEAD)

# if the branchname contains a "/" we suspect a ticketid after it
if [[ $branchname == *"/"* ]]
then
  ticketid=$(echo $branchname | cut -f2 -d"/")
  commit_msg="$ticketid: $commit_msg"
fi

# check if correct commit message length is used
used_characters=$(printf "$commit_msg" | wc -c)

if [ "$used_characters" -le "$MAX_CHARACTERS" ]
then
  git commit -m "$commit_msg"
else
  chars_over_max=$(expr $used_characters - $MAX_CHARACTERS)
  printf "The chosen commit message contains $chars_over_max chars too much.\nPlease choose a shorter message\n"
fi
