#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#-------------------------------------------------
# General Stteings
#-------------------------------------------------
export LANG=en_US.UTF-8
# export TERM="xterm-256color"
# [[ $TMUX = "" ]] && export TERM="xterm-256color"

export EDITOR=nvim
export VISUAL=nvim

# command history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

DIRSTACKSIZE=100
setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt IGNOREEOF               # Ctrl+Dでログアウトしてしまうことを防ぐ
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない
# setopt globdots      # 隠しファイルを補完対象などに含める

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=30000            # メモリに保存されるヒストリの件数
SAVEHIST=30000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

### KeyBinding ###
# bindkey -e # emacs キーマップ
bindkey -v # vim キーマップ
bindkey -M viins '^J' vi-cmd-mode

# viinsをemacsモードのように
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^B'  backward-char
bindkey -M viins '^F'  forward-char
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

# モードを表示
if [[ -s "${ZDOTDIR:-$HOME}/.zsh-vimode-visual.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh-vimode-visual.zsh"
fi

function zle-line-init zle-line-finish zle-keymap-select {
  VIM_NORMAL="%K%F%k%f%K{166}%F{237} % N %k%f%K%F{166}%k%f"
  VIM_INSERT="%K%F%k%f%K{032}%F{237} % I %k%f%K%F{032}%k%f"
  VIM_VISUAL="%K%F%k%f%K{029}%F{237} % V %k%f%K%F{029}%k%f"
  case $KEYMAP in
    main|viins)
      RPS1="${VIM_INSERT}"
      ;;
    vicmd)
      RPS1="${VIM_NORMAL}"
      ;;
    vivis|vivli)
      RPS1="${VIM_VISUAL}"
      ;;
  esac
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

: "Ctrl-Wでパスの文字列などをスラッシュ単位で削除する" && {
 autoload -U select-word-style
 select-word-style bash
}

### Alias ###
alias -g ...="../.."
alias -g ....="../../.."
alias updatedb='sudo /usr/libexec/locate.updatedb' # データベースの更新

# neovim
alias vim='nvim'

export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# normal-vim
alias oldvim="\vim"

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# python
alias python='python3'

# ocamlのalias
alias ocaml="rlwrap ocaml"

# kubectl
source <(kubectl completion zsh)
alias k='kubectl'
complete -o default -F __start_kubectl k

# exa
alias e='exa'
alias ea='exa -aa'
alias el='exa -l'
alias ee='exa -aal'
alias et='exa -lT'

export PGDATA='/usr/local/var/postgres'

#-------------------------------------------------
# Path
#-------------------------------------------------

PATH=/opt/local/bin:/opt/local/sbin:$PATH

# MANPATH
MANPATH=/opt/local/man:$MANPATH

# brew
export PATH=/usr/local/bin:$PATH

export HOMEBREW_UPGRADE_CLEANUP=1

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# direnv
eval "$(direnv hook zsh)"

# mysql
export PATH=$PATH:/usr/local/mysql/bin

# Haskell
export PATH=$HOME/Library/Haskell/bin:$PATH

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# Go
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 11.0.2`

# openssl
export PATH=/usr/local/opt/openssl/bin:$PATH

# openmpi
export MANPATH=/opt/openmpi/share/man:$MANPATH
export LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
export PATH="/opt/openmpi/bin:$PATH"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# carch
export PATH="/opt/carch/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl-openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl-openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl-openssl/lib/pkgconfig"

# flutter
export PATH="$PATH:$HOME/flutter/bin"

# ImageMagick
export PKG_CONFIG_PATH=/opt/ImageMagick/lib/pkgconfig

# git-escape-magic (git使用時HEAD^をHEAD\^と自動エスケープ)
fpath=(~/.functions ${fpath})
autoload -Uz git-escape-magic
git-escape-magic

# cd-bookmark (ディレクトリをブックマーク)
fpath=(~/.zsh/functions/cd-bookmark(N-/) $fpath)
autoload -Uz cd-bookmark

# git stashが使えない問題の対処
export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

# tab_title
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# markdown -> Tex --> made pdf
alias mdtx='mdtex.sh'

# markdown -> Tex shellscript
if [ -d $HOME/tools ]
then
    PATH=$PATH:$HOME/Tools; export PATH
fi

# サーチパスに~/scripts/mybinを追加
PATH=$PATH:~/scripts/mybin

# OPAM configuration
# . /Users/takumi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# peco(ヒストリを便利に)の設定
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ^gbでブランチをフィルタリング
function peco-git-branch () {
  local current_buffer=$BUFFER
  local selected_branch_name="$(git branch -a | peco | tr -d ' ' | tr -d '*')"
  case "$selected_branch_name" in
    *-\>* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*->(.*?)\/(.*)$/\2/;print')";;
    remotes* )
      selected_branch_name="$(echo ${selected_branch_name} | perl -ne 's/^.*?remotes\/(.*?)\/(.*)$/\2/;print')";;
  esac
  if [ -n "$selected_branch_name" ]; then
    BUFFER="${current_buffer}${selected_branch_name}"
  # カーソル位置を末尾に移動
    CURSOR=$#BUFFER
  fi
}
zle -N peco-git-branch
bindkey '^gb' peco-git-branch

# ^ghでgitのコミットハッシュをフィルタリング
# function peco-git-hash () {
#   local current_buffer=$BUFFER
#   local git_hash="$(git log --oneline --branches | peco | awk '{print $1}')"
#   BUFFER="${current_buffer}${git_hash}"
#   # カーソル位置を末尾に移動
#   CURSOR=$#BUFFER
# }
# zle -N peco-git-hash
# bindkey '^gh' peco-git-hash

# ^gsでgitのstashのIDを取得
function peco-git-stash () {
  local current_buffer=$BUFFER
  local stash="$(git stash list | peco | awk -F'[ :]' '{print $1}')"
  BUFFER="${current_buffer}${stash}"
  # カーソル位置を末尾に移動
  CURSOR=$#BUFFER
}
zle -N peco-git-stash
bindkey '^gs' peco-git-stash

# ^gpでPull Requestのブランチにチェックアウト
function peco-checkout-pull-request() {
  local selected_pr_id=$(gh pr list | peco | awk '{ print $1 }')
  if [ -n "$selected_pr_id" ]; then
      BUFFER="gh pr checkout ${selected_pr_id}"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-checkout-pull-request
bindkey '^gp' peco-checkout-pull-request

# ^eaエイリアスをフィルタリング
function aliasp () {
  BUFFER=$(alias | peco --query "$LBUFFER" | awk -F"=" '{print $1}')
  print -z "$BUFFER"
}
zle -N aliasp
# bindkey '^ea' aliasp

# aws cliの結果をフィルタリングしてsshする
function ssh-peco(){
  ip=$( aws ec2 describe-instances | jq -cr '.Reservations[].Instances[]|[.PrivateIpAddress,.Tags[].Value]' | peco --query "$BUFFER" | awk -F"[\"]" '{print $2}' )
  ssh ${ip}
}

# ^e^pでプロセスID取得
function peco-ps () {
  local current_buffer=$BUFFER
  local process_id="$(ps aux | peco | awk '{print $2}')"
  BUFFER="${current_buffer}${process_id}"
  # カーソル位置を末尾に移動
  CURSOR=$#BUFFER
}
zle -N peco-ps
bindkey '^e^p' peco-ps

# search repository(ローカルリポジトリのファイル, ディレクトリ検索)
function peco-cd-repository() {
  DIR=$(\find ~/.ghq/github.com ~/go/src/github.com -type d -a \! -regex '.*/\.git.*' | peco | head -n 1)
  pushd $DIR > /dev/null
  zle clear-screen
}
function peco-find-repository() {
  local l=$(\find ~/.ghq/github.com ~/go/src/github.com -a \! -regex '.*/\.git.*' | peco)
  BUFFER="${LBUFFER}${l}"
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-cd-repository
zle -N peco-find-repository
bindkey '^g^r' peco-cd-repository
bindkey '^g^f' peco-find-repository

# search current directory(カレントディレクトリ下の検索)
# peco-find: ドットファイルを検索対象としない
# peco-find-all: 全て検索対象
function peco-find() {
  local l=$(\find . -maxdepth 8 -a \! -regex '.*/\..*' | peco)
  BUFFER="${LBUFFER}${l}"
  CURSOR=$#BUFFER
  zle clear-screen
}
function peco-find-all() {
  local l=$(\find . -maxdepth 8 | peco)
  BUFFER="${LBUFFER}${l}"
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-find
zle -N peco-find-all
bindkey '^e^f' peco-find
bindkey '^e^a' peco-find-all

# agで検索した結果から選択し、ファイルを開く
# function peco-grep() {
#   path=$(ag $* | peco | awk -F: '{printf  $1 " +" $2}'| sed -e 's/\+$//')
#   if [ -n "$path" ]; then
#     echo "$path"
#   fi
# }
# zle -N peco-grep
# bindkey '^eg' peco-grep

# pecoでtmuxのwindowをselect
function peco-select_window() {
  tmux list-windows | peco | awk -F':' '{print $1}' | xargs tmux select-window -t
}
zle -N peco-select_window
bindkey '^e^w' peco-select_window

# === cool-peco init ===
FPATH="$FPATH:$HOME/.ghq/github.com/ryoppy/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================
bindkey '^e^h' cool-peco-ssh
bindkey '^go' cool-peco-git-checkout
bindkey '^gl' cool-peco-git-log

function peco-ghq() {
  local repo="$(ghq list | peco)"
  if [[ -n "$repo" ]]; then
    local dst="${HOME}/.ghq/${repo}"
    cd "${dst}"
    zle reset-prompt
  fi
}
zle -N peco-ghq
bindkey '^g^g' peco-ghq

# ディレクトリスタックからディレクトリ移動
function peco-pushd() {
  local pushd_number=$(dirs -v | peco | awk {'print $1'})
  pushd +$pushd_number
  zle clear-screen
}
zle -N peco-pushd
bindkey '^e^r' peco-pushd

# cd-bookmarkでブックマークしたディレクトリに移動
function peco-cd-bookmark() {
  local selected_bm=$(cd-bookmark | peco | awk -F "|" '{ print $1 }')
  cd-bookmark "${selected_bm}"
  zle clear-screen
}
zle -N peco-cd-bookmark
bindkey '^e^e' peco-cd-bookmark

# cd-bookmarkでブックマークしたディレクトリをfinderで開く
function peco-open-bookmark() {
  cd-bookmark | peco | awk -F "|" '{ print $2 }' | xargs open
}
zle -N peco-open-bookmark
bindkey '^e^m' peco-open-bookmark

# ディレクトリ移動
function peco-cd {
  local sw="1"
  while [ "$sw" != "0" ]
  do
    if [ "$sw" = "1" ];then
     local list=$(echo -e "---$PWD\n../\n$( ls -F | grep / )\n---Show hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
    elif [ "$sw" = "2" ];then
     local list=$(echo -e "---$PWD\n$( ls -a -F | grep / | sed 1d )\n---Hide hidden directory\n---Show files, $(echo $(ls -F | grep -v / ))\n---HOME DIRECTORY")
    else
     local list=$(echo -e "---BACK\n$( ls -F | grep -v / )")
    fi

    local slct=$(echo -e "$list" | peco )

    if [ "$slct" = "---$PWD" ];then
     local sw="0"
    elif [ "$slct" = "---Hide hidden directory" ];then
     local sw="1"
    elif [ "$slct" = "---Show hidden directory" ];then
     local sw="2"
    elif [ "$slct" = "---Show files, $(echo $(ls -F | grep -v / ))" ];then
     local sw=$(($sw+2))
    elif [ "$slct" = "---HOME DIRECTORY" ];then
     cd "$HOME"
    elif [[ "$slct" =~ / ]];then
     cd "$slct"
    elif [ "$slct" = "" ];then
     :
    else
     local sw=$(($sw-2))
    fi
  done
  zle clear-screen
}
zle -N peco-cd
bindkey '^ed' peco-cd

# カレントディレクトリ下のディレクトリを検索してcd
function peco-find-cd() {
  local dir=$(\find . -maxdepth 8 -type d | peco)
  cd "${dir}"
  zle clear-screen
}
zle -N peco-find-cd
bindkey '^e^d' peco-find-cd

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
