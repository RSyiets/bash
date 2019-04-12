# bash

## 1. NeoBundleの取得
> mkdir -p ~/.vim/bundle  
> git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim  


## 2. Vim Smartinputの編集
閉括弧を削除しても開括弧が削除されないようにする．  
~/.vim/bundle/vim-smartinput/autoload/smartinput.vimの&lt;BS&gt;&lt;BS&gt;が割り当てられている行を消去する．  


## 3. Gitの設定  
> git config --global user.name "Foo"  
> git config --global user.email bar@example.com  


## 4. git-forestaのインストール
> curl -L https://github.com/takaaki-kasai/git-foresta/raw/master/git-foresta -o ~/bin/git-foresta && chmod +x ~/bin/git-foresta  

