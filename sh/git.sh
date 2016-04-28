#! /bin/bash

DOTPATH=$HOME/.dotfiles
DOT_FILES=( .gitconfig )

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        ln -snfv $DOTPATH/$file $HOME/$file.dot
        echo "file exists. create *.dot files... : $file"
    else
        ln -snfv $DOTPATH/$file $HOME/$file
    fi
done
