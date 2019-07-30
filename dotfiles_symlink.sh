#!/usr/bin/env bash
set -u

DIR="$(cd "$(dirname $0)" && pwd)"
cd "$DIR"

link_dotfiles() {
  local files=(
    .ctags
    .gitconfig
    .gitmessage.txt
    .ideavimrc
    .tmux.conf
    .vimrc
    .zshrc
    .peco/config.json
    .config/nvim/init.vim
    .config/tmux/get_buttery_tmux.sh
  )

  for file in ${files[@]}; do
    local src="$DIR/$file"
    local dst="$HOME/$file"

    echo "Creating symlink: $src => $dst"

    local dir="$(dirname $file)"
    local dst_dir="$HOME/$dir"
    [[ ! -d "$dst_dir" ]] && mkdir -p "$dst_dir"

    ln -sf "$src" "$dst"
  done
}

run() {
  link_dotfiles
}

run
