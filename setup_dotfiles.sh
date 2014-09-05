#!/bin/bash

echo 'BASH Setup!'

CURRENTDIR=$(pwd)

pushd $HOME

ln -s $CURRENTDIR/dotfiles/.inputrc
ln -s $CURRENTDIR/dotfiles/.profile
ln -s $CURRENTDIR/dotfiles/.bashrc
ln -s $CURRENTDIR/dotfiles/.bashrc .bash_profile # handle login/sshs
ln -s $CURRENTDIR/dotfiles/.bash_logout
ln -s $CURRENTDIR/dotfiles/.Xmodmap
ln -s $CURRENTDIR/dotfiles/.emacs.d
ln -s $CURRENTDIR/dotfiles/.pythonstartup.py
ln -s $CURRENTDIR/dotfiles/.gitconfig
popd
