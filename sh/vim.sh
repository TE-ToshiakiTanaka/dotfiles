#! /bin/bash

DOTPATH=$HOME/.dotfiles
DOT_FILES=( .vimrc .vim )

mkdir -p $DOTPATH/.vim/bundle
mkdir -p ~/.vimbackup
git clone https://github.com/Shougo/neobundle.vim $DOTPATH/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc $DOTPATH/.vim/bundle/vimproc

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        ln -snfv $DOTPATH/$file $HOME/$file.dot
        echo "file exists. create *.dot files... : $file"
    else
        ln -snfv $DOTPATH/$file $HOME/$file
    fi
done
