set nocompatible
filetype plugin indent on

"プラグイン
call plug#begin()
Plug 'bronson/vim-trailing-whitespace' "文末スペースの視覚化
Plug 'elzr/vim-json'              "JSONファイルの表示関連
Plug 'kana/vim-smartinput'        "入力補助
Plug 'kana/vim-submode'           "コマンド入力補助
Plug 'leafgarland/typescript-vim' "タイプスクリプト関連
Plug 'reireias/vim-cheatsheet'    "チートシートを表示
Plug 'scrooloose/nerdtree'        "ファイルをツリーで表示
Plug 'scrooloose/syntastic'       "シンタックスチェッカー
Plug 'tomasr/molokai'             "カラースキーム
Plug 'tomtom/tcomment_vim'        "コメントアウトの簡易化
Plug 'tpope/vim-fugitive'         "Git操作
Plug 'tpope/vim-surround'         "クオートの入力補助
Plug 't9md/vim-quickhl'           "簡易検索
Plug 'vim-airline/vim-airline'    "ステータスバーの見た目を変更
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'        "インデントの可視化

if(!has('python3'))
  Plug 'Shougo/neocomplcache.vim'
elseif(has('nvim'))
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'

if v:version >= 800
  Plug 'yuttie/comfortable-motion.vim' "スクロールをスムーズに行う
endif
call plug#end()

"==================================================
"表示設定
set number    "行番号を表示する
set title     "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on     "コードの色分け
set backspace=indent,eol,start "vim8でバックスペースが効かない時の対策

"インデントをスペース2つ分に設定
set tabstop=2
set shiftwidth=2

set expandtab       "タブの代わりにスペースを入力する
set cursorline      "現在行を強調表示
set smartindent     "オートインデント
set laststatus=2    "ステータスラインを常に表示(NERDTreeをデフォルト非表示)
set background=dark "配色の変更
set t_Co=256        "iTerm2など既に256色環境なら無くても良い
set encoding=utf-8

"全角スペースの強調
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/

"カラースキーム
colorscheme molokai

"行番号の色
highlight LineNr ctermfg=darkgray
"コメントの色
highlight Comment ctermfg=6

"TypeScriptのシンタックスハイライト
autocmd BufRead,BufNewFile *.ts set filetype=typescript

"背景の透過設定
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"JSONの表示設定
let g:vim_json_syntax_conceal = 0 "ダブルクォートを表示する

"==================================================
"ビープ音
set visualbell "鳴らないようにする

"==================================================
"検索関連設定
set ignorecase "大文字/小文字の区別なく検索する
set smartcase  "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch  "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan   "検索時に最後まで行ったら最初に戻る
set hlsearch   "検索語をハイライト表示

"Escでハイライトを解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"vim-quickhlのキーバインド
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"==================================================
"バックアップ
set nobackup "バックアップをとらない

"==================================================
"入力関連
set whichwrap=b,s,[,],<,> "カーソルの回りこみができるように

"==================================================
"vim-airline
let g:airline_theme = 'violet'

"==================================================
"貼り付け設定

"ビジュアルモードで連続ペーストをできるようにする
function! Put_text_without_override_register()
  let line_len = strlen(getline('.'))
  execute "normal! `>"
  let col_loc = col('.')
  execute 'normal! gv"_x'
  if line_len == col_loc
    execute 'normal! p'
  else
    execute 'normal! P'
  endif
endfunction
xnoremap <silent> p :call Put_text_without_override_register()<CR>

"ヤンクした内容をクリップボードにコピー
set clipboard=unnamed

"==================================================
"シンタックスチェッカー

"ファイル形式がruby, tsの時だけコーディング規約チェック
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': ['typescript']}
let g:syntastic_typescript_checkers=['tslint']

"==================================================
"キーバインド

"全てのウインドウを閉じる
nnoremap qa :qall<CR>
nnoremap yqa yy:qall!<CR>

"全角入力時用
nnoremap クァ :qall<CR>
nnoremap ：q :q<CR>
nnoremap ：q！ :q!<CR>
nnoremap ：w :w<CR>
nnoremap い i
nnoremap ・ /

"上半ページ移動を片手でできるように
nnoremap <C-f> <C-u>
nnoremap <C-u> <C-f>

"ディレクトリのツリー表示
map <C-n> :NERDTreeToggle<CR>

"行末までヤンク
nnoremap Y y$

"ウィンドウ関連
nnoremap s <Nop>
nnoremap st gt
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
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

"スクロール設定
if v:version >= 800
  let g:comfortable_motion_no_default_key_mappings = 1
  nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
  nnoremap <silent> <C-f> :call comfortable_motion#flick(-100)<CR>
  nnoremap <silent> <C-u> :call comfortable_motion#flick(200)<CR>
  nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>
endif

"==================================================
"Smart Inputの設定
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
  \ 'at'    : '(\%#)',
  \ 'char'  : '<Space>',
  \ 'input' : '<Space><Space><Left>'
  \ })
call smartinput#define_rule({
  \ 'at'    : '( \%# )',
  \ 'char'  : '<BS>',
  \ 'input' : '<Del><BS>'
  \ })

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

"==================================================
"neocomplcacheの設定

if(!has('python3'))
  "neocomplcacheを有効化
  let g:neocomplcache_enable_at_startup = 1
  "smartcaseを有効化
  let g:neocomplcache_enable_smart_case = 1
  "補完を行う最小の長さを設定
  let g:neocomplcache_min_syntax_length = 3
  "文字入力時にのみポップアップを出す
  let g:neocomplcache_enable_insert_char_pre = 1

  "辞書の定義
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

  "前回行われた補完をキャンセルする
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  "補完候補の中から共通する部分を補完する
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  "エンターキーで候補を確定
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
  "次の候補を選択
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  "文字を削除した時にポップアップを閉じる
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  "選択している候補を確定する
  inoremap <expr><C-y>  neocomplcache#close_popup()
  "選択している候補をキャンセルしてポップアップを閉じる
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
endif

"==================================================
"deopleteの設定

if(has('python3'))
  "deopleteを有効化
  let g:deoplete#enable_at_startup = 1

  call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ 'on_insert_enter': v:false,
    \ })

  set completeopt+=noinsert

  " エンターキーで候補を確定
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
  " 次の候補を選択
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " "文字を削除した時にポップアップを閉じる
  inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
endif

"==================================================
"チートシートの指定
let g:cheatsheet#cheat_file = '~/.vim_cheatsheet'
