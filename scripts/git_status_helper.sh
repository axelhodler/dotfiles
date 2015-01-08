#!/bin/sh

COUNT=0

git status -sb |
  while read line;
    do
      if [ "$COUNT" -ge 1 ]; then
        echo $line | sed -e "s#^#[$COUNT] #g"
      else
        echo $line
      fi
      (( COUNT++ ))
    done
