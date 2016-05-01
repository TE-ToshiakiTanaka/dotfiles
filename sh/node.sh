#! /bin/bash

sudo apt-get install curl

if [ "$(uname)" == 'Darwin' ]; then
    echo "Darwin"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # install nodebrew.
    curl -L git.io/nodebrew | perl - setup
    echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> ~/.bashrc
    source ~/.bashrc
    if [ ! -e ~/.zshrc.local ]; then
        touch ~/.zshrc.local
    fi
    echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> ~/.zshrc.local

elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    echo 'MINGW'

else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
