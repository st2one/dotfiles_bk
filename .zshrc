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
export LANG=ja_JP.UTF-8
export TERM=xterm-256color

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
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
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

#-------------------------------------------------
# Path
#-------------------------------------------------

PATH=/opt/local/bin:/opt/local/sbin:$PATH

#MANPATH
MANPATH=/opt/local/man:$MANPATH

# brew
export PATH=/usr/local/bin:$PATH

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
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Python
export PYENV_ROOT=${HOME}/.pyenv
  export PATH="${PYENV_ROOT}/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"

#export PYTHONSTARTUP=$HOME/.pythonrc.py
#PYTHONPATH=~/Library/Python/debug_toolbar:$PYTHONPATH
#export PYTHONPATH
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Java
#export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

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
export PATH=/usr/local/bin:$PATH

# openmpi
export MANPATH=/opt/openmpi/share/man:$MANPATH
export LD_LIBRARY_PATH=/opt/openmpi/lib:$LD_LIBRARY_PATH
export PATH="/opt/openmpi/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# MAMP PHP
export PATH="/Applications/MAMP/bin/php/php5.5.26/bin:$PATH"

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
