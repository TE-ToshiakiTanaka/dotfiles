#! /bin/sh

DOTPATH=$HOME/.dotfiles

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue

    if [ -a $HOME/$f ]; then
        ln -snfv $DOTPATH/$f $HOME/$f.dot
        echo "file exists. create *.dot files... : $f"
    else
        ln -snfv $DOTPATH/$f $HOME/$f
    fi
done
