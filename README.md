# bash

## 1. vim-plugの導入
下のコマンドを実行．
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

プラグインをインストールするには，Vimを起動して下のコマンドを実行する．
> :PlugInstall

参考: [junegunn/vim-plug](https://github.com/junegunn/vim-plug)

## 2. Vim Smartinputの編集
閉括弧を削除しても開括弧が削除されないようにする．  
~/.vim/plugged/vim-smartinput/autoload/smartinput.vimの&lt;BS&gt;&lt;BS&gt;が割り当てられている行を消去する．  


## 3. Gitの設定  
> git config --global user.name "Foo"  
> git config --global user.email bar@example.com  


## 4. git-forestaのインストール
> curl -L https://github.com/takaaki-kasai/git-foresta/raw/master/git-foresta -o ~/bin/git-foresta && chmod +x ~/bin/git-foresta  

