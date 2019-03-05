" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-submode'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'nathanaelkane/vim-indent-guides' "インデントの視覚化
NeoBundle 'scrooloose/nerdtree' "ファイルをツリーで表示
NeoBundle 'scrooloose/syntastic'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


"表示設定
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2
set expandtab
set cursorline "現在行を強調表示
set smartindent "オートインデント
set background=dark "配色の変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white "全角スペースの強調
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert "カラースキーマ
highlight LineNr ctermfg=darkgray "行番号の色

"ビープ音
set visualbell "鳴らないようにする

"検索関連設定
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR><Esc> "Escでハイライトを解除

set whichwrap=b,s,[,],<,> "カーソルの回りこみができるように

"vim-indent-guidesをオンに
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#444433 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray

"ファイル形式がruby, tsの時だけコーディング規約チェック
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ['typescript']}
let g:syntastic_typescript_checkers=['tslint']

"==================================================
"キーバインド

"全てのウインドウを閉じる
nnoremap qa :qall<CR>

"上半ページ移動を片手でできるように
nnoremap <C-f> <C-u>
nnoremap <C-u> <C-f>

"ディレクトリのツリー表示
cnoremap tree NERDTree

"unixコマンド
"nnoremap cmd :!command<Space>

"行末までヤンク
nnoremap Y y$

"ウィンドウ関連
nnoremap s <Nop>
nnoremap st gt
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sw <C-w>w
nnoremap s= <C-w>=
call submode#enter_with('bufmove', 'n', '', 'st', 'gt')
call submode#enter_with('bufmove', 'n', '', 'sw', '<C-w>w')
call submode#enter_with('bufmove', 'n', '', 's.', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's,', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', 't', 'gt')
call submode#map('bufmove', 'n', '', 'w', '<C-w>w')
call submode#map('bufmove', 'n', '', '.', '<C-w>>')
call submode#map('bufmove', 'n', '', ',', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

"Smart Inputの設定
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
	\	'at'    : '(\%#)',
	\	'char'  : '<Space>',
	\	'input' : '<Space><Space><Left>'
	\	})
call smartinput#define_rule({
	\	'at'    : '( \%# )',
	\	'char'  : '<BS>',
	\	'input' : '<Del><BS>'
	\	})

call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>')
call smartinput#define_rule({
  \ 'at'    : '()\%#',
  \ 'char'  : '<BS>',
  \ 'input' : '<BS>',
  \ })
call smartinput#define_rule({
  \ 'at'    : '{}\%#',
  \ 'char'  : '<BS>',
  \ 'input' : '<BS>',
  \ })

call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({
  \   'at'       : '\%#',
  \   'char'     : '#',
  \   'input'    : '#{}<Left>',
  \   'filetype' : ['ruby'],
  \   'syntax'   : ['Constant', 'Special']
  \   })

call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#define_rule({
  \   'at' : '\({\|\<do\>\)\s*\%#',
  \   'char' : '<Bar>',
	\   'input' : '<Bar><Bar><Left>',
  \   'filetype' : ['ruby']
  \    })

"TypeScriptのシンタックスハイライト
autocmd BufRead,BufNewFile *.ts set filetype=typescript

