" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off
"===========================
" 画面表示の設定
"===========================
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
" set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:\▸\-,extends:❯,precedes:❮ " 不可視文字の表示記号指定
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set title         " ウインドウのタイトルバーにファイルのパス情報等を表示する
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set background=dark
set splitbelow " 新しいウインドウを下に開く
set splitright " 新しいウインドウを右に開く
" set termguicolors
" set ambiwidth=double

" tabにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %

augroup MyAutoGroup
    autocmd!
augroup END

"全角スペースの可視化
"augroup highlightIdegraphicSpace
"  autocmd!
"  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

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
"set clipboard=unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
"set mouse=a  " マウスの入力を受け付ける
"set shellslash " Windows でもパスの区切り文字を / にする
"set iminsert=2 " インサートモードから抜けると自動的にIMEをオフにする

let g:python_host_prog = expand('/usr/local/bin/python2')
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

"==============================
" コマンドラインの設定
"==============================
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効に>する
" set showcmd " 入力中のコマンドを表示する
set noshowcmd " 入力中のコマンドを表示しない
set history=10000 " コマンドラインの履歴を10000件保存する

"=============================
" ビープの設定
"=============================
set visualbell t_vb=  "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"================================
" dein
"================================
" Flags
let s:use_dein = 1

" vi compatibility
if !&compatible
  set nocompatible
endif

" Prepare .vim dir
let s:vimdir = $HOME . "/.vim"
if has("vim_starting")
  if ! isdirectory(s:vimdir)
    call system("mkdir " . s:vimdir)
  endif
endif

" dein
let s:dein_enabled  = 0
if s:use_dein && v:version >= 704
  let s:dein_enabled = 1

  " Set dein paths
  let s:dein_dir = s:vimdir . '/dein'
  let s:dein_github = s:dein_dir . '/repos/github.com'
  let s:dein_repo_name = "Shougo/dein.vim"
  let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name

  " Check dein has been installed or not.
  if !isdirectory(s:dein_repo_dir)
    echo "dein is not installed, install now "
    let s:dein_repo = "https://github.com/" . s:dein_repo_name
    echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
    call system("git clone " . s:dein_repo . " " . s:dein_repo_dir)
  endif
  let &runtimepath = &runtimepath . "," . s:dein_repo_dir


  " Check cache
  if dein#load_state(s:dein_dir)
    " Begin plugin part
    call dein#begin(s:dein_dir)

    call dein#add('Shougo/dein.vim')

    call dein#add('Shougo/vimproc', {
          \ 'build': {
          \     'windows': 'tools\\update-dll-mingw',
          \     'cygwin': 'make -f make_cygwin.mak',
          \     'mac': 'make -f make_mac.mak',
          \     'linux': 'make',
          \     'unix': 'gmake'}})

    " call dein#add('Shougo/unite.vim', {
    "       \ 'depends': ['vimproc'],
    "       \ 'on_cmd': ['Unite'],
    "       \ 'lazy': 1})
    call dein#add('Shougo/unite.vim')

    if has('python3')
      call dein#add('Shougo/denite.nvim')
      call dein#add('Shougo/neomru.vim')
    else
      call dein#add('Shougo/unite.vim')
      call dein#add('Shougo/neomru.vim')
    endif

    if ((has('nvim')  || has('timers')) && has('python3')) && system('pip3 show neovim') !=# ''
      call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
      if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
      endif
    elseif has('lua')
      call dein#add('Shougo/neocomplete.vim')
    endif

    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
    " call dein#add('ujihisa/neco-look')
    call dein#add('Shougo/neoyank.vim')
    call dein#add('mklabs/split-term.vim')
    call dein#add('Shougo/tabpagebuffer.vim')
    call dein#add('Shougo/neosnippet', {'on_i': 1, 'on_ft': ['snippet'], 'depends': ['neosnippet-snippets']})
    " call dein#add('Shougo/neosnippet', {'on_i': 1})
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('Shougo/vimfiler')
    call dein#add('kassio/neoterm')
    " call dein#add('ryanoasis/vim-devicons')
    call dein#add('LeafCage/yankround.vim')
    " call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('kana/vim-submode')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('cohama/lexima.vim')
    call dein#add('mattn/emmet-vim')
    call dein#add('rhysd/clever-f.vim')
    call dein#add('tpope/vim-endwise')
    call dein#add('slim-template/vim-slim')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add("Yggdroot/indentLine")
    call dein#add('sjl/gundo.vim')
    call dein#add('thinca/vim-quickrun')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('godlygeek/tabular')
    call dein#add('rcmdnk/vim-markdown')
    call dein#add('joker1007/vim-markdown-quote-syntax')
    call dein#add('kannokanno/previm')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('w0rp/ale')

    call dein#add('nanotech/jellybeans.vim')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('tomasr/molokai')
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('jeffreyiacono/vim-colors-wombat')
    call dein#add('croaker/mustang-vim')
    call dein#add('jpo/vim-railscasts-theme')

    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " if has('lua')
    "   call dein#add('Shougo/neocomplete.vim', {
    "         \ 'on_i': 1,
    "         \ 'lazy': 1})
    "
    "   call dein#add('ujihisa/neco-look', {
    "         \ 'depends': ['neocomplete.vim']})
    " endif

    " call dein#add('tyru/open-browser.vim', {
    "       \ 'on_map': ['<plug>(openbrowser-smart-search)'],
    "       \ 'lazy': 1})
    call dein#add('tyru/open-browser.vim')

    call dein#end()

    call dein#save_state()
  endif
 
  " Installation check.
  if dein#check_install()
    call dein#install()
  endif
endif

if s:dein_enabled && dein#tap("unite.vim")
  nnoremap [unite] <Nop>
  nmap <Leader>u [unite]
  nnoremap <silent> [unite]b :Unite buffer<CR>
endif

"===============================
" color schema
"===============================
syntax on
syntax enable
" colorscheme dracula
" color Dracula
" colorscheme solarized
" colorscheme molokai
" colorscheme hybrid
" colorscheme mustang
colorscheme jellybeans
" colorscheme wombat
" colorscheme railscasts
" 行番号の色
" highlight LineNr ctermfg=darkyellow
highlight LineNr ctermfg=130
" highlight LineNr ctermfg=148
" 編集業の行番号の色
highlight CursorLineNr term=bold ctermfg=11
highlight clear CursorLine


"==============================
" Unite
"==============================
" 入力モードで開始する
let g:unite_enable_start_insert=1

" バッファ一覧
" noremap <C-P> :Unite buffer<CR>

" ファイル一覧
" noremap <C-N> :Unite -buffer-name=file file<CR>

" 最近使ったファイルの一覧
" noremap <C-Z> :Unite file_mru<CR>

" sourcesを「今開いているファイルのディレクトリ」とする
" noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
" nnoremap <silent> ,g  :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
" nnoremap <silent> ,cg :<C-u>Unite grep -buffer-name=search-buffer<CR><C-R><C-W>

" Unite.vimの設定
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
" nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uB :<C-u>Unite buffer_tab -buffer-name=file<CR>
" nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ut :<C-u>Unite tab<CR>
nnoremap <silent> ,un :<C-u>Unite file/new<CR>
" ファイル非同期検索
" nnoremap <silent> ,up  :<C-u>Unite file_rec/async:!<CR>

" book-mark list
noremap ,bm :Unite bookmark<CR>
" add book-mark
noremap ,ba :UniteBookmarkAdd<CR>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s= <C-w>=
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    s [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
    
" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブ閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>
    
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
" 単語単位からパス単位で削除するように変更
imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
" ESCキーを2回押すと終了する
nmap <silent><buffer> <ESC><ESC> q
imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction


"==============================
" Denite
"==============================
if dein#tap('denite.nvim')
  " Add custom menus
  let s:menus = {}
  let s:menus.file = {'description': 'File search (buffer, file, file_rec, file_mru'}
  let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
  let s:menus.others = {'description': 'Others (command, command_history, help)'}
  let s:menus.file.command_candidates = [
        \ ['buffer', 'Denite buffer'],
        \ ['file: Files in the current directory', 'Denite file'],
        \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
        \ ['file_mru: Most recently used files', 'Denite file_mru']
        \ ]
  let s:menus.line.command_candidates = [
        \ ['change', 'Denite change'],
        \ ['grep :grep', 'Denite grep'],
        \ ['line', 'Denite line'],
        \ ['tag', 'Denite tag']
        \ ]
  let s:menus.others.command_candidates = [
        \ ['command', 'Denite command'],
        \ ['command_history', 'Denite command_history'],
        \ ['help', 'Denite help']
        \ ]

  call denite#custom#var('menu', 'menus', s:menus)

  nnoremap [denite] <Nop>
  nmap ,u [denite]
  nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
  " nnoremap <silent> [denite]B :<C-u>Denite buffer_tab -buffer-name=file<CR>
  nnoremap <silent> [denite]c :<C-u>Denite change<CR>
  nnoremap <silent> [denite]f :<C-u>Denite file<CR>
  nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
  nnoremap <silent> [denite]h :<C-u>Denite help<CR>
  nnoremap <silent> [denite]l :<C-u>Denite line<CR>
  nnoremap <silent> [denite]T :<C-u>Denite tag<CR>
  nnoremap <silent> [denite]u :<C-u>Denite file_mru<CR>
  nnoremap <silent> [denite]m :<C-u>Denite menu<CR>
  nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
  " nnoremap <silent> [denite]t :<C-u>Denite tab<CR>
  " nnoremap <silent> ,bm :<C-u>Denite -direction=topleft -cursor-wrap=true bookmark<CR>
  " nnoremap <silent> ,ba :<C-u>DeniteBookmarkAdd<CR>
  call denite#custom#map('_', "<C-h>",
        \ '<denite:do_action:split>')
  call denite#custom#map('insert', "<C-h>",
        \ '<denite:do_action:split>')
  call denite#custom#map('_', "<C-v>",
        \ '<denite:do_action:vsplit>')
  call denite#custom#map('insert',
        \ "<C-v>", '<denite:do_action:vsplit>')
  call denite#custom#map('insert',
        \ "jj", '<denite:enter_mode:normal>')

  call denite#custom#map(
        \ 'insert',
        \ '<Down>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
    call denite#custom#map(
        \ 'insert',
        \ '<Up>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-N>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-P>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-G>',
        \ '<denite:assign_next_txt>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<C-T>',
        \ '<denite:assign_previous_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'normal',
        \ '/',
        \ '<denite:enter_mode:insert>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<Esc>',
        \ '<denite:enter_mode:normal>',
        \ 'noremap'
        \)
endif


"==============================
" key-bind
"==============================
"emacs-like key bind
"imap <silent> <c-p> <up>
"imap <silent> <c-n> <down>
"imap <silent> <c-b> <left>
"imap <silent> <c-f> <right>
"imap <silent> <c-a> <home>
"imap <silent> <c-e> <end>
"imap <silent> <c-d> <del>
"imap <silent> <C-K> <C-O>
"imap <silent> <C-Y> <C-R>

"括弧の補完(改行してインデント)
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

" 基本的なキーマッピング変更
noremap j gj
noremap k gk
noremap <S-h> g^
noremap <S-l> g$
noremap <S-m> %
noremap <S-j> }
noremap <S-k> {

"jjでノーマルモード
inoremap jj <esc>

"rだけでリドゥ
" nnoremap r <C-r>

"Yで行末までヤンク
nnoremap Y y$

"**************************************************
" <Space>* によるキーバインド設定
"**************************************************

"--------------------------------------------------
" <Space>i でコードをインデント整形
map <Space>i gg=<S-g><C-o><C-o>zz

"--------------------------------------------------
" <Space>v で1行選択(\n含まず)
noremap <Space>v 0v$h

"--------------------------------------------------
" <Space>d で1行削除(\n含まずに dd)
noremap <Space>d 0v$hx

"--------------------------------------------------
" <Space>y で改行なしで1行コピー（\n を含まずに yy）
noremap <Space>y 0v$hy

"--------------------------------------------------
" <Space>s で置換
noremap <Space>s :%s/

"--------------------------------------------------
" <Space>co で1行コメントアウト(Ruby形式)
" map <Space>co <S-i># <ESC>

"--------------------------------------------------
" <Space>uc で1行アンコメント。コメントアウトの行頭の# を削除(Ruby形式)
map <Space>uc ^xx<ESC>

" <Space>cd で編集ファイルのカレントディレクトリへと移動
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>


" デフォルトで起動するshellはzsh
set sh=zsh
" set termkey=<A-w>
" neovim terminal mapping
if has('nvim')
  " 新しいタブでターミナルを起動
  nnoremap <silent> @t :tabe<CR>:terminal<CR>
  nnoremap <silent> ,t :<C-u>16Term<CR>
  nnoremap <silent> ,vt :<C-u>VTerm<CR>
  " Ctrl + q でターミナルを終了
  tnoremap <C-q> <C-\><C-n>:q<CR>
  " ESCでターミナルモードからノーマルモードへ
  tnoremap <silent> <ESC> <C-\><C-n>
  tnoremap <silent> <C-j> <C-\><C-n>
endif

function! s:open(args) abort
  if empty(term_list())
    execute "terminal" a:args
  else
    let bufnr = term_list()[0]
    execute term_getsize(bufnr)[0] . "new"
    execute "buffer + " bufnr
  endif
endfunction
" すでに :terminal が存在していればそのterminal を使用する
command! -nargs=*
\   Terminal call s:open(<q-args>)

" terminal起動直後にinsert抜ける(terminalモードへ)
" if has('nvim')
"   " Neovim 用
"   autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" else
"   " Vim 用
"   autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
" endif

" neotermの設定
nnoremap @p :T python3 %<CR><c-w>j
" REPLを自動的に改行
let g:neoterm_autoscroll=1

" vimfiler設定
" ファイル名長くて全て見れないときは<C-g>で全部見れる

" vimfilerをデフォルトのexplorerに
let g:vimfiler_as_default_explorer = 1
" デフォルトのセーフモードを解除
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Space>vf :VimFilerBufferDir<CR>
" Open filer
noremap <silent> ,vf :VimFiler -split -simple -winwidth=40 -no-quit<CR>
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=40 -no-quit<ENTER>
" Don't let <CR> enter the directory but let it open the directory
autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" ファイルに対しeコマンド(or Enter)で新規タブで開く
let g:vimfiler_edit_action = 'tabopen'
" Unite bookmarkからEnterでvimfiler上で移動
" autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')
" 自動でカレントディレクトリ変更
let g:vimfiler_enable_auto_cd = 1
" 開いているファイルをvimfilerで開く
nnoremap <silent> ,tr :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" 開いているファイルをIDEっぽく階層的に表示
nnoremap <silent> ,ie :<C-u>VimFilerExplorer -find -simple -winwidth=40 -no-quit<CR>
" 現在開いているバッファのディレクトリを表示(<C-e>で表示/非表示)使い勝手良い
nnoremap <silent> <C-e> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

" QuickLook使ってプレビュー(,v)
let g:vimfiler_quick_look_command = 'qlmanage -p'
autocmd FileType vimfiler nmap <buffer> ,v <Plug>(vimfiler_quick_look)

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示


" tcomment_vimキーマップ変更
let g:tcommentMapLeader1 = '<C-_>'
let g:tcommentMapLeader2 = '<Leader>'
let g:tcommentMapLeaderOp1 = 'gc'
let g:tcommentMapLeaderOp2 = 'gC'

" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
  \'php_surround' : "<?php %s ?>",
  \'eruby_surround' : "<%% %s %%>",
  \'eruby_surround_minus' : "<%% %s -%%>",
  \'eruby_surround_equality' : "<%%= %s %%>",
\}

" emmetキーマップ変更
let g:user_emmet_leader_key = '<C-E>'
let g:user_emmet_settings = {'variables' : { 'lang' : 'ja' }}
                
" マッピングを追加
function! SetErubyMapping2()
  nmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  nmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  nmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
                      
  vmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  vmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  vmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
endfunction
                            
" erubyのときだけ設定を追加
au FileType eruby call SetErubyMapping2()
" phpのときだけ設定を追加
au FileType php nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c :TCommentAs php_surround<CR>


" Markdownの設定
" set syntax=markdown
set shellslash
" ,pvでプレビュー
nnoremap <silent> ,pv :PrevimOpen<CR>

" autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" " Disable highlight italic in Markdown
" autocmd FileType markdown hi! def link markdownItalic LineNr
if has("autocmd")
  augroup MyAutoCmd
    autocmd!

    " md等の拡張子をMarkdownと判断させるための設定
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    " イタリックフォントを無効にする設定
    autocmd FileType markdown hi! def link markdownItalic LineNr
  augroup END
endif
" html
hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg

" markdownの折りたたみなし
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_new_list_item_indent = 2
" for plasticboy/vim-markdown
" let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_liquid=1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_folding_style_pythonic = 1
" 強調(**)など同じ行内に閉じる**がなければ強調しない
let g:vim_markdown_empasis_multiline = 1
" 強調文字(**)など隠さない
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:markdown_fenced_languages = [
\  'coffee',
\  'css',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'xml',
\  'zsh',
\  'scala',
\  'java',
\  'c',
\  'php'
\]

" previmのプレビューのデザイン変更
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/.previm/markdown.css'


" Vim-Quickrunの設定
let g:quickrun_config = {
\   "_" :{
\       'runner'    : 'vimproc',
\       'runner/vimproc/updatetime' : 60,
\       'outputter' : 'error',
\       'outputter/error/success' : 'buffer',
\       'outputter/error/error'   : 'quickfix',
\       'outputter/buffer/split'  : ':rightbelow 15sp',
\       'outputter/buffer/close_on_empty' : 1,
\   },
\   "tex" : {
\       'command' : 'latexmk',
\       'outputter/error/error' : 'quickfix',
\       'hook/cd/directory': '%S:h',
\       'exec': '%c %s'
\   },
\   "python": {
\       'command': 'python3'
\   },
\}
let g:quickrun_config['vim'] = {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "utf-8",
\}
" 出力バッファ閉じる(Space + q)
nnoremap <Space>q :<C-u>bw! \[quickrun\ output\]<CR>
" キーマッピング変更(Space + r)
nnoremap <silent> <Space>r :QuickRun<CR>
" <C-c>でquickrun停止
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"tex形式のファイルにおいてgqコマンドを実行した時には選択範囲に対してmarkdown->LaTex変換を行うようにする
augroup texfile
autocmd BufRead,BufNewFile *.tex set filetype=tex
let md_to_latex  = "pandoc --from=markdown --to=latex"
autocmd Filetype tex let &formatprg=md_to_latex
augroup END

" Ocamlにおけるmerlin(エラーチェック)の設定
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merlin/vim'

" Ocamlにおけるocp-indentの設定
" execute 'set rtp^=' . g:opamshare . '/ocp-indent/vim'
"
" function! s:ocaml_format()
"     let now_line = line('.')
"     exec ':%! ocp-indent'
"     exec ':' . now_line
" endfunction
"
" augroup ocaml_format
"     autocmd!
"     autocmd BufWrite,FileWritePre,FileAppendPre *.mli\= call s:ocaml_format()
"   augroup END


"自動でペーストモード
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

" neosnippet
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
" 上部タブバー右にバッファを表示させない
" let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme = 'jellybeans'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
  \}

set timeout timeoutlen=1000 ttimeoutlen=50

" gitgutter
" gitの差分を表示
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
nmap gv <Plug>GitGutterPreviewHunk
nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk
set updatetime=250

" ALE(シンタックスチェッカー)
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" ファイルを保存するときにチェックしない
let g:ale_lint_on_save = 0

" clever-f.vim
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_not_overwrites_standard_mappings = 1
" f, Fのみ利用(t, Tは使わない)
map f <Plug>(clever-f-f)
map F <Plug>(clever-f-F)

" ,scでエラーチェック
nnoremap ,sc :<C-u>ALELint<CR>
nmap <silent> <Space>p <Plug>(ale_previous)
nmap <silent> <Space>n <Plug>(ale_next)
nmap <silent> <Space>a <Plug>(ale_toggle)
command! ALEList call s:ale_list()
nnoremap <Space>m  :ALEList<CR>
autocmd MyAutoGroup FileType help,qf,man,ref let b:ale_enabled = 0
" シンボル変更
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⨉'

let g:ale_linters = {
      \   'eruby': [],
      \}

" Gundo.vim
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap U :GundoToggle<CR>

"エスケープをcontrol+jにマッピング
imap <C-j> <esc>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" 左下のinsertモードなどの表示をしない
set noshowmode

" 各種メッセージを英語にする
language C

" set clipboard+=unnamedplus
if $TMUX == ''
  set clipboard+=unnamed
endif

" 選択範囲を<,c>でクリップボードに
vmap ,c :w !xsel -ib<CR><CR>

" 挿入モード時にカーソルを移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>

filetype plugin indent on
