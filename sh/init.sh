#! /bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    echo "Darwin"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # install nodebrew.
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install build-essential curl git openssh-server checkinstall libcurl4-openssl-dev

elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    echo 'MINGW'

else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
