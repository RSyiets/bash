# bash

## 1. NeoBundleの取得
> $ mkdir -p ~/.vim/bundle  
> $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  


## 2. Vim Smartinputの編集
閉括弧を削除しても開括弧が削除されないようにする．  
~/.vim/bundle/vim-smartinput/autoload/smartinput.vimの<BS><BS>が割り当てられている行を消去する．  

