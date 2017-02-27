#!/bin/bash
rm -r ~/.shells/
rm ~/.bashrc
rm ~/.vimrc

cp -r shells ~/.shells/
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc

