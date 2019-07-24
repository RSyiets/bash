#!/bin/bash
rm -f ~/.shells/alias
rm -f ~/.shells/git
rm -f ~/.shells/print0
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.vim_cheatsheet

cp shells/* ~/.shells/
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp vim_cheatsheet ~/.vim_cheatsheet

