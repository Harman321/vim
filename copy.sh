#!/bin/sh

# back config
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak

# copy new config
cp -r vim   ~/.vim
cp vimrc ~/.vimrc
