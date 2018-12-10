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
# export locale=en_US.UTF-8
# export TERM=xterm-256color
# [[ $TMUX = "" ]] && export TERM="xterm-256color"
[[ $TMUX = "" ]] && export TERM="screen-256color"

# command history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

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
#bindkey -e # emacs キーマップを選択
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

# normal-vim
alias oldvim="\vim"

# ctags
alias ctags="`brew --prefix`/bin/ctags"

# python
alias python='python3'

# ocamlのalias
alias ocaml="rlwrap ocaml"

# kubectl
alias kbc='kubectl'

# mybin
alias makedirs="makedirs.sh"

alias cfo="cd ~/github/freee/CFO-Alpha"
alias line_light="cd ~/github/line_light"
alias date-adjuster="cd ~/github/date-adjuster"
alias uniform-navi="cd ~/github/bros/uniform-navi"

export EDITOR=nvim

#-------------------------------------------------
# Path
#-------------------------------------------------

PATH=/opt/local/bin:/opt/local/sbin:$PATH

#MANPATH
MANPATH=/opt/local/man:$MANPATH

# brew
export PATH=/usr/local/bin:$PATH

export HOMEBREW_UPGRADE_CLEANUP=1

#VHDL
export PATH=$PATH:/Developer/Simulator/GHDL/bin:/Developer/Simulator/GTKwave/bin

#mysql
export PATH=$PATH:/usr/local/mysql/bin

# MacPorts Installer addition on 2012-10-11_at_04:18:37: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

#carch
export PATH=/Users/nikaido/work/carch/bin:$PATH

# Haskell
export PATH=$HOME/Library/Haskell/bin:$PATH
# nodejs
#export PATH=$HOME/usr/local/share/npm/bin:$PATH
#export PATH=~/node_modules/typescript/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# Python
export PYENV_ROOT=${HOME}/.pyenv
  export PATH="${PYENV_ROOT}/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

# Alias(activate / deactivate)
alias conda-activate='source $PYENV_ROOT/versions/anaconda3-5.0.0/bin/activate'
alias conda-deactivate='source $PYENV_ROOT/versions/anaconda3-5.0.0/bin/deactivate'

#export PYTHONSTARTUP=$HOME/.pythonrc.py
#PYTHONPATH=~/Library/Python/debug_toolbar:$PYTHONPATH
#export PYTHONPATH

# Add path for pip
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Java
#export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

# Node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# nodenv
export PATH=$HOME/.nodenv/bin:$PATH
eval "$(nodenv init -)"

# Postgres
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

# MongoDB
export PATH=/usr/local/Cellar/mongodb/2.2.0-x86_64/bin:$PATH

# Antlr4
export CLASSPATH=/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH
# Antlr3
export CLASSPATH=/usr/local/lib/antlr-4.0-complete.jar:$CLASSPATH

# opencv
export PYTHONPATH=/usr/local/Cellar/opencv/2.4.9/lib/python2.7/site-packages:$PYTHONPATH

# tex
PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/

# gcc-6
# export PATH=/usr/local/bin:$PATH

# openmpi
export MANPATH=/opt/openmpi/share/man:$MANPATH
export LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
export PATH="/opt/openmpi/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# MAMP PHP
export PATH="/Applications/MAMP/bin/php/php5.5.26/bin:$PATH"

# carch
export PATH="/opt/carch/bin:$PATH"

# git使用時HEAD^をHEAD\^と自動エスケープ
fpath=(~/.functions ${fpath})
autoload -Uz git-escape-magic
git-escape-magic

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/st2one/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/st2one/google-cloud-sdk/completion.zsh.inc'

# tab_title
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# markdown -> Tex --> made pdf
alias mdtx='mdtex.sh'

# markdown -> Tex shellscript
if [ -d $HOME/tools ]
then
    PATH=$PATH:$HOME/Tools; export PATH
fi

# Add path for pip
for DIR in $HOME/Library/Python/2.7/bin $HOME/.local/bin ; do
  if [ -d ${DIR} ] ; then
    PATH=${PATH}:${DIR}
  fi
done

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Go
# GOPATH: Goのライブラリがインストールされるパス
export GOPATH="$HOME/go"
export GOROOT="$( go env GOROOT )"
export PATH="$GOPATH/bin:$PATH"

# goenv
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

# Yarn
export PATH="/usr/local/Cellar/yarn/1.7.0/bin:$PATH"

# サーチパスに~/mybinを追加
PATH=$PATH:~/mybin

# kubectlの補完機能
source <(kubectl completion zsh)

# powerlineによりzshの見た目を変更
# powerline-daemon -q
# . /Users/takumi/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# tmuxのzshとの連携
# シェルにログインした時に、デタッチされたセッションがあればアタッチし
# なければ tmux new-session を実行するように
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

# OPAM configuration
. /Users/takumi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# peco(ヒストリを便利に)の設定
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ^ebでブランチをフィルタリング
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
bindkey '^eb' peco-git-branch

# ^ecでgitのコミットハッシュをフィルタリング
function peco-git-hash () {
  local current_buffer=$BUFFER
  local git_hash="$(git log --oneline --branches | peco | awk '{print $1}')"
  BUFFER="${current_buffer}${git_hash}"
  # カーソル位置を末尾に移動
  CURSOR=$#BUFFER
}
zle -N peco-git-hash
bindkey '^ec' peco-git-hash

# ^esでgitのstashのIDを取得
function peco-git-stash () {
  local current_buffer=$BUFFER
  local stash="$(git stash list | peco | awk -F'[ :]' '{print $1}')"
  BUFFER="${current_buffer}${stash}"
  # カーソル位置を末尾に移動
  CURSOR=$#BUFFER
}
zle -N peco-git-stash
bindkey '^es' peco-git-stash

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

# ^epでプロセスID取得
function peco-ps () {
  local current_buffer=$BUFFER
  local process_id="$(ps aux | peco | awk '{print $2}')"
  BUFFER="${current_buffer}${process_id}"
  # カーソル位置を末尾に移動
  CURSOR=$#BUFFER
}
zle -N peco-ps
bindkey '^ep' peco-ps

# search repository(ローカルリポジトリのファイル, ディレクトリ検索)
function peco-cd-repository() {
  DIR=$(\find ~/gitrepos ~/my/go/src/github.com -type d -a \! -regex '.*/\.git.*' | peco | head -n 1)
  pushd $DIR > /dev/null
  zle clear-screen
}
function peco-find-repository() {
  local l=$(\find ~/gitrepos ~/my/go/src/github.com -a \! -regex '.*/\.git.*' | peco)
  BUFFER="${LBUFFER}${l}"
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-cd-repository
zle -N peco-find-repository
bindkey '^ed' peco-cd-repository
bindkey '^er' peco-find-repository

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
bindkey '^ef' peco-find
bindkey '^ea' peco-find-all

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
bindkey '^tw' peco-select_window

# === cool-peco init ===
FPATH="$FPATH:/Users/takumi/github/cool-peco"
autoload -Uz cool-peco
cool-peco
# ======================
bindkey '^eh' cool-peco-ssh
bindkey '^eco' cool-peco-git-checkout
bindkey '^el' cool-peco-git-log

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
