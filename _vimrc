" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off

"===========================
" 画面表示の設定
"===========================
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮    " 不可視文字の表示記号指定
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set statusline+=%{fugitive#statusline()}            " ステータス行に現在のgitブランチを表示する
set title         " ウインドウのタイトルバーにファイルのパス情報等を表示する
set t_Co=256

"===========================
" カーソル移動関連の設定
"===========================
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルが行頭、行末で止まらないようにする
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set ruler                      " カーソルが何行目の何列目に置かれているかを表示する

"============================
" ファイル処理関連の設定
"============================
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

"============================
" 検索/置換の設定
"============================
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
"set gdefault   " 置換の時 g オプションをデフォルトで有効にする

"=============================
" タブ/インデントの設定
"============================
set expandtab       " タブ入力を複数の空白入力に置き換える
set tabstop=2       " 画面上でタブ文字が占める幅
set shiftwidth=2    " 自動インデントでずれる幅
set softtabstop=2   " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent      " 改行時に前の行のインデントを継続する
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"==============================
"動作環境との統合関連の設定
"==============================
set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
"set mouse=a  " マウスの入力を受け付ける
"set shellslash " Windows でもパスの区切り文字を / にする
"set iminsert=2 " インサートモードから抜けると自動的にIMEをオフにする

"==============================
" コマンドラインの設定
"==============================
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set showcmd " 入力中のコマンドを表示する
set history=10000 " コマンドラインの履歴を10000件保存する

"=============================
" ビープの設定
"=============================
set visualbell t_vb=  "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"============================
" 全角スペースの表示
"============================
"function! ZenkakuSpace()
"    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
"endfunction
"if has('syntax')
"    augroup ZenkakuSpace
"        autocmd!
"        "ZenkakuSpace をカラーファイルで設定するなら、
"        "次の行をコメントアウト
"        autocmd ColorScheme       * call ZenkakuSpace()
"        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
"    augroup END
"    call ZenkakuSpace()
"endif

"================================
" NeoBundle
"================================
if has('vim_starting')
    set nocompatible               " be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundle 'Shougo/neobundle.vim'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
"NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
"NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
" NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
" NeoBundle 'tpope/vim-surround'

" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'
" " ログファイルを色づけしてくれる
" NeoBundle 'vim-scripts/AnsiEsc.vim'
" " 行末の半角スペースを可視化(うまく動かない？)
" NeoBundle 'bronson/vim-trailing-whitespace'
" " less用のsyntaxハイライト
" NeoBundle 'KohPoll/vim-less'

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

" hybrid カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
"NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
"NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
"NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
"NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
"NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
"NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
"NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" Doracula
NeoBundle 'zenorocha/dracula-theme', {'rtp' : 'vim'}
" カラースキーム一覧表示に Unite.vim を使う
"NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" " this will conveniently prompt you to install them.
NeoBundleCheck

"===============================
" color schema
"===============================
syntax on
syntax enable
color Dracula
"colorscheme solarized 
"colorscheme hybrid
" 行番号の色
" highlight LineNr ctermfg=darkyellow

"==============================
" Unit
"==============================
" 入力モードで開始する
let g:unite_enable_start_insert=1

" バッファ一覧
noremap <C-P> :Unite buffer<CR>

" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>

" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"==============================
" key-bind
"==============================
"emacs-like key bind
"imap <silent> <C-P> <Up>
"imap <silent> <C-N> <Down>
"imap <silent> <C-B> <Left>
"imap <silent> <C-F> <Right>
"imap <silent> <C-A> <Home>
"imap <silent> <C-E> <End>
"imap <silent> <C-D> <Del>
"imap <silent> <C-K> <C-O>
"imap <silent> <C-Y> <C-R>

"========================================
" automatically complement (), {}, []
"========================================
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"====================================
" 最後のカーソル位置を復元する
"====================================
"if has("autocmd")
"    autocmd BufReadPost *
"    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"    \   exe "normal! g'\"" |
"    \ endif
"endif
