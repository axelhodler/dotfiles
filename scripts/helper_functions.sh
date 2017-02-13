#!/bin/sh

mcd () {
    mkdir -p $1
    cd $1
}

sshre () {
  RET=1;
  until [[ $RET = 0 ]];do
    echo "$(date): Attempting...";
    ssh $1;
    RET="$?";sleep 1;
  done
}

ffind () {
  find `pwd` -iname $1
}
