#!/bin/bash
rm -fr ~/.shells/
rm -f ~/.bashrc
rm -f ~/.vimrc
rm -f ~/.vim_cheatsheet

cp -r shells ~/.shells/
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp vim_cheatsheet ~/.vim_cheatsheet

