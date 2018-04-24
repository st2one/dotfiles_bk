#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
  autoconf
  freetype
  fribidi
  ghostscript
  jemalloc
  libtiff
  little-cms2
  openssl
  rbenv
  xz
  automake
  gdbm
  git
  glib
  jpeg
  libtool
  lua
  luajit
  perl
  python3
  pandoc
  pango
  open-mpi
  openssl
  ruby-build
  zsh
  cabal-install
  gettext
  gmp
  libpng
  libuv
  msgpack
  readline
  reattach-to-user-namespace
  qt
  pcre
  unibilium
  cmake
  ghc
  imagemagick
  isl
  iproute2mac
  fontconfig
  fontforge
  libtermkey
  libvterm
  neovim
  pkg-config
  vim
  gcc
  gcc@6
  mysql
  postgresql
  sqlite
  pyenv
  pyenv-virtualenv
  rbenv
  nodebrew
  tmux
  redis
  ricty
  ocaml
  ocamlbuild
  opam
  rlwrap
  peco
  the_silver_searcher
  highway
)

"brew tap..."
brew tap caskroom/cask
brew tap homebrew/core
brew tap neovim/neovim

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
  dropbox
  evernote
  skitch
  google-chrome
  slack
  alfred
  iterm2
  virtualbox
  vagrant
  vagrant-manager
  karabiner-elements
  shiftit
  cheatsheet
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
