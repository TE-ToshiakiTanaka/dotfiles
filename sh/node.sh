#! /bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    echo "Darwin"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # install nodebrew.
    sudo apt-get -y install curl
    curl -L git.io/nodebrew | perl - setup
    echo "if [[ -f ~/.nodebrew/current/bin ]]; then " >> ~/.bashrc
    echo "\texport PATH=\$HOME/.nodebrew/current/bin:\$PATH" >> ~/.bashrc
    echo "\tnodebrew use latest" >> ~/.bashrc
    echo "fi" >> ~/.bashrc
    source ~/.bashrc

    if [ ! -e ~/.zshrc.local ]; then
        touch ~/.zshrc.local
    fi
    echo "if [[ -f ~/.nodebrew/current/bin ]]; then " >> ~/.zshrc.local
    echo "\texport PATH=\$HOME/.nodebrew/current/bin:\$PATH" >> ~/.zshrc.local
    echo "\tnodebrew use latest" >> ~/.zshrc.local
    echo "fi" >> ~/.zshrc.local

elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    echo 'MINGW'

else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
