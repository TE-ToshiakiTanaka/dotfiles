#! /bin/bash

DOTPATH=$HOME/.dotfiles
DOT_FILES=( .zshrc .zprofile .zshenv )

if [ "$(uname)" == 'Darwin' ]; then
    echo "Darwin"

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # install nodebrew.
    sudo apt-get install zsh
    for file in ${DOT_FILES[@]}
    do
        if [ -a $HOME/$file ]; then
            ln -snfv $DOTPATH/$file $HOME/$file.dot
            echo "file exists. create *.dot files... : $file"
        else
            ln -snfv $DOTPATH/$file $HOME/$file
        fi
    done

elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then
    echo 'MINGW'

else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
