#!/bin/bash
rm -fr ~/.shells/
rm -f ~/.bashrc
rm -f ~/.vimrc

cp -r shells ~/.shells/
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc

