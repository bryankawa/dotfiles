#!/bin/sh -x

for dotfile in .gitignore .gitconfig .zshrc .vimrc .vim .oh-my-zsh .rbenv .tmux.conf .percol.d
do
  rm -fr ~/$dotfile
  ln -s $PWD/$dotfile ~/$dotfile
done
