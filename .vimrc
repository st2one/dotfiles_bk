" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" 一旦ファイルタイプ関連を無効化する
filetype off
"===========================
" 画面表示の設定
"===========================
set number         " 行番号を表示する
" set cursorline     " カーソル行の背景色を変える
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
" set ambiwidth=double

" tabにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %

"全角スペースの可視化
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGray guibg=DarkGray
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

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

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" yank historyにコピー履歴(Uniteで使用)
NeoBundle 'Shougo/neoyank.vim'
" ファイル操作
NeoBundle 'Shougo/vimfiler'
" ペーストを便利に
NeoBundle 'LeafCage/yankround.vim'
" ファイル検索
NeoBundle 'ctrlpvim/ctrlp.vim'
" 検索高速に
" NeoBundle 'rking/ag.vim'
" tabpageのバッファ表示(Unite)
NeoBundle 'Shougo/tabpagebuffer.vim'
" ファイルをtree表示してくれる
" NeoBundle 'scrooloose/nerdtree'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" HTMLやCSSの入力を効率化
NeoBundle 'mattn/emmet-vim'
" テキストを囲うものを編集する
NeoBundle 'tpope/vim-surround'
" Rails向けのコマンドを提供する
"NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" slimのシンタックスハイライトを行う
NeoBundle 'slim-template/vim-slim'
" coffeescriptのシンタックスハイライトを行う
NeoBundle 'kchmck/vim-coffee-script'
" マッピング便利に
NeoBundle "kana/vim-submode"
" インデントの可視化
NeoBundle "Yggdroot/indentLine"
" アンドゥツリーの可視化
NeoBundle "sjl/gundo.vim"
" 置換のプレビュー
NeoBundle 'osyo-manga/vim-over'
" パワーライン
" NeoBundle 'powerline/powerline' , {'rtp': 'powerline/bindings/vim/'}
" エアライン
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" ライトライン
" NeoBundle 'itchyny/lightline.vim'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
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
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'

" Markdown
" NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" hybrid カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" solarized カラースキーム
" NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
" NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
" NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
" NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
" NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" Doracula
NeoBundle 'dracula/vim'
" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()
NeoBundleCheck

"===============================
" color schema
"===============================
syntax on
syntax enable
" colorscheme dracula
" color Dracula
" colorscheme solarized
" colorscheme hybrid
" colorscheme mustang
colorscheme jellybeans
" colorscheme hybrid
" colorscheme railscasts
" 行番号の色
" highlight LineNr ctermfg=darkyellow

"==============================
" Unite
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

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

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
" neocomplete
"==============================
" _(アンダースコア)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 2
" 区切り文字まで補完するneosnippet#expandable() ?
let g:neocomplete#enable_auto_delimiter = 1
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""
" preview window を閉じない
let g:neocomplete#enable_auto_close_preview = 0

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ocamlの自動補完設定
let g:neocomplete#sources#omni#input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'

" syntastic設定
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行しない
let g:syntastic_check_on_open = 0
" 「:wq」で終了する時構文エラーチェックしない
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'passive_filetypes': [] }

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ocaml_checkers = ['merlin']

" normal モードのとき、,sc でコーディングルールをチェック
nnoremap <silent> ,sc :<C-u>SyntasticCheck<CR>

let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

" vim-over設定
" over.vimの起動
nnoremap <silent> <Space>m :OverCommandLine<CR>%s///gc<Left><Left><Left><Left>

" カーソル下の単語をハイライト付きで置換
nnoremap <silent> sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap <silent> subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" yankround.vim設定
"" キーマップ
nmap rp <Plug>(yankround-p)
nmap rP <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

" ヤンク履歴をUniteでリスト表示
" noremap ,y :<C-u>Unite yankround<CR>

" ctrlp設定
" # ctrlpのキーマッピングを <C-p>からs*に変更
" # yankround.vimで<C-p>を使用しているため，衝突回避
" Prefix: s
" 検索してファイル見つかったらEnter(現在のウインドウで), <C-t>(新規タブで), <C-v>(垂直分割で), <C-s>(水平分割で)開ける
nnoremap s <Nop>
nnoremap sa :<C-u>CtrlP<Space>
nnoremap sb :<C-u>CtrlPBuffer<CR>
nnoremap sd :<C-u>CtrlPDir<CR>
nnoremap sf :<C-u>CtrlP<CR>
" nnoremap sl :<C-u>CtrlPLine<CR>
nnoremap sm :<C-u>CtrlPMRUFiles<CR>
" nnoremap sq :<C-u>CtrlPQuickfix<CR>
" nnoremap ss :<C-u>CtrlPMixed<CR>
" nnoremap st :<C-u>CtrlPTag<CR>

let g:ctrlp_map = '<Nop>'
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
" # キャッシュを使用して検索を高速化
" let g:ctrlp_use_caching = 1
" # vim終了時にキャッシュをクリアしない
let g:ctrlp_clear_cache_on_exit = 0
" # <c-r>でキャッシュをクリアして再検索
" let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<C-r>'] }
" # 検索の際に200[ms]のウェイトを入れる（１文字入力の度に検索結果がコロコロ変わるのが気に入らないため）
let g:ctrlp_lazy_update = 200
" # 検索結果の表示ウィンドウの設定，10件分を表示（それ以上になってもスクロールされる）
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
" # 隠しファイルを表示しない
let g:ctrlp_show_hidden = 0
" # 検索してほしくないファイルやディレクトリを除外
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \}
" agで検索して高速に
let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g '

" Gundo.vim設定
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap U :GundoToggle<CR>

" Uniteキーマッピング
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>

" neosnippetキーマップ
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

" emmetキーマップ変更
let g:user_emmet_leader_key = '<C-E>'
let g:user_emmet_settings = {'variables' : { 'lang' : 'ja' }}

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
" Ctrl-pでプレビュー
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
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_folding_style_pythonic = 1
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
set splitright " 新しいウインドウを右に開く
" 出力バッファ閉じる(Space + q)
nnoremap <Space>q :<C-u>bw! \[quickrun\ output\]<CR>
" キーマッピング変更(Space + r)
nnoremap <silent> <Space>r :QuickRun<CR>
" <C-c>でquickrun停止
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" Unite.vimの設定
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uB :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ut :<C-u>Unite tab<CR>
nnoremap <silent> ,un :<C-u>Unite file/new<CR>
" ファイル非同期検索
nnoremap <silent> ,up  :<C-u>Unite file_rec/async:!<CR>

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
" s1 で1番左のタブ、s2 で1番左から2番目のタブにジャンプ


call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" Uniteでファイルやディレクトリ開く
" yankroundが有効な場合は前の候補へ、yankroundが有効でない場合はUniteを実行する
" ファイル検索
nmap <expr>,sf ":<C-u>execute
      \ 'Unite'
      \ '-start-insert'
      \ 'buffer file_mru'
      \ 'file:'.fnameescape(expand('%:p:h'))
      \ (isdirectory(getcwd().'/.git') ?
      \      'file_rec/git:--cached:--others:--exclude-standard' :
      \      'file_rec/async')
      \ <CR>"

let s:unite_ignore_file_rec_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/\|'
      \ .'\.\(bmp\|gif\|jpe\?g\|png\|webp\|ai\|psd\)"\?$'

call unite#custom#source(
      \ 'file_rec/async,file_rec/git',
      \ 'ignore_pattern',
      \ s:unite_ignore_file_rec_patterns)

" ディレクトリ検索
nnoremap ,sd :<C-u>Unite
      \ -start-insert -default-action=vimfiler
      \ directory directory_mru directory_rec/async
      \ <CR>

let s:unite_ignore_directory_patterns=
      \ ''
      \ .'vendor/bundle\|.bundle/\|\.sass-cache/\|'
      \ .'node_modules/\|bower_components/'

call unite#custom#source(
      \ 'directory_mru,directory_rec/async',
      \ 'ignore_pattern',
      \ s:unite_ignore_directory_patterns)

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction


" vimshellのマッピング
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

" NERDTreeのマッピング
nnoremap <silent> <Space>nt :NERDTreeToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" ブックマークをデフォルト表示
let g:NERDTreeShowBookmarks=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('py',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('md',     'green',   'none', 'green',   '#151515')
" call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
" call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
" call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
" call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'green',   'none', 'green',   '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
" call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable  = '▶'
" let g:NERDTreeDirArrowCollapsible = '▼'

" vimfiler設定
" ファイル名長くて全て見れないときは<C-g>で全部見れる

" vimfilerをデフォルトのexplorerに
let g:vimfiler_as_default_explorer = 1
" デフォルトのセーフモードを解除
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Space>vf :VimFiler<CR>
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
" let g:vimfiler_enable_auto_cd = 1
" 開いているファイルをvimfilerで開く
nnoremap <silent> ,tr :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" 開いているファイルをIDEっぽく階層的に表示
nnoremap <silent> ,ie :<C-u>VimFilerExplorer -find -simple -winwidth=40 -no-quit<CR>
" 現在開いているバッファのディレクトリを表示(<C-e>で表示/非表示)使い勝手良い
nnoremap <silent> <C-e> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -toggle -no-quit<CR>
" デフォルトキーッマップt廃止(タブ移動でないから)
" nnoremap [vimfiler] <nop>



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
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

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

"--------------------------------------------------
" Ctrl + v で複数行を矩形選択後、<Space>co で複数行コメントアウト(Ruby形式)
" vmap <Space>co <S-i># <ESC>

"--------------------------------------------------
" 最初にヤンクした文字列を繰り返しペースト
" vnoremap <Space>p "0p

" --------------------------------------------------
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

"エスケープをcontrol+jにマッピング
imap <C-j> <esc>

" 挿入モード時にカーソルを移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" 左下のinsertモードなどの表示をしない
set noshowmode

"==============================
" ステータスライン
"==============================
" 現在のgitブランチを表示
" set statusline=%{fugitive#statusline()}
" ファイル名のみ表示
" set statusline+=%t
" 変更チェック表示
" set statusline+=%m
" 読み込み専用かどうか表示
" set statusline+=%r
" ヘルプページなら[HELP]と表示
" set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
" set statusline+=%w
" これ以降は右寄せ表示
" set statusline+=%=
" file encoding
" set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
" set statusline+=[LOW=%l/%L]

" powerlineによりvimのステータスラインを変更
" python import sys; sys.path.append("/Library/Python/2.7/site-packages")
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set timeout timeoutlen=1000 ttimeoutlen=50

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
let g:airline_symbols.linenr = '☰'
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

" lightline設定
" let g:lightline = {
"         \ 'colorscheme': 'wombat',
"         \ 'mode_map': {'c': 'NORMAL'},
"         \ 'active': {
"         \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filepath' ] ]
"         \ },
"         \ 'component_function': {
"         \   'modified': 'LightlineModified',
"         \   'readonly': 'LightlineReadonly',
"         \   'fugitive': 'LightlineFugitive',
"         \   'filename': 'LightlineFilename',
"         \   'fileformat': 'LightlineFileformat',
"         \   'filetype': 'LightlineFiletype',
"         \   'fileencoding': 'LightlineFileencoding',
"         \   'mode': 'LightlineMode',
"         \   'filepath': 'FilePath'
"         \ }
"         \ }
"
" function! LightlineModified()
"   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
" endfunction
"
" function! LightlineReadonly()
"   return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
" endfunction
"
" function! LightlineFilename()
"   return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"         \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
" endfunction
"
" function! LightlineFugitive()
"   if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"     return fugitive#head()
"   else
"     return ''
"   endif
" endfunction
"
" function! LightlineFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction
"
" function! LightlineFiletype()
"   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
" endfunction
"
" function! LightlineFileencoding()
"   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
" endfunction
"
" function! LightlineMode()
"   return  &ft == 'unite' ? 'Unite' :
"         \ &ft == 'vimfiler' ? 'VimFiler' :
"         \ &ft == 'vimshell' ? 'VimShell' :
"         \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction
"
" function! FilePath()
"     if winwidth(0) > 120
"       return expand("%:s")
"     else
"       return expand("%:t")
"     endif
"   endfunction

filetype plugin indent on

" Vimの起動時NeoBundleがなかった場合
let $VIMBUNDLE = '~/.vim/bundle'
let $NEOBUNDLEPATH = $VIMBUNDLE . '/neobundle.vim'
if stridx(&runtimepath, $NEOBUNDLEPATH) != -1
" If the NeoBundle doesn't exist.
command! NeoBundleInit try | call s:neobundle_init()
            \| catch /^neobundleinit:/
                \|   echohl ErrorMsg
                \|   echomsg v:exception
                \|   echohl None
                \| endtry

function! s:neobundle_init()
    redraw | echo "Installing neobundle.vim..."
    if !isdirectory($VIMBUNDLE)
        call mkdir($VIMBUNDLE, 'p')
        echo printf("Creating '%s'.", $VIMBUNDLE)
    endif
    cd $VIMBUNDLE

    if executable('git')
        call system('git clone git://github.com/Shougo/neobundle.vim')
        if v:shell_error
            throw 'neobundleinit: Git error.'
        endif
    endif

    set runtimepath& runtimepath+=$NEOBUNDLEPATH
    call neobundle#rc($VIMBUNDLE)
    try
        echo printf("Reloading '%s'", $MYVIMRC)
        source $MYVIMRC
    catch
        echohl ErrorMsg
        echomsg 'neobundleinit: $MYVIMRC: could not source.'
        echohl None
        return 0
    finally
        echomsg 'Installed neobundle.vim'
    endtry

    echomsg 'Finish!'
endfunction

autocmd! VimEnter * redraw
            \ | echohl WarningMsg
            \ | echo "You should do ':NeoBundleInit' at first!"
            \ | echohl None
endif
