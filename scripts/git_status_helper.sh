#!/bin/sh

COUNT=-1

git status -sb |
  while read line;
    do
      if [ "$COUNT" -ge 0 ]; then
        echo $line | sed -e "s#^#[$COUNT] #g"
      else
        echo $line
      fi
      (( COUNT++ ))
    done
