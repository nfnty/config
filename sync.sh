#!/bin/bash
mkdir -p "$HOME"/.config
rsync -a --delete .config/htop "$HOME"/.config

rsync -a --delete .vim "$HOME" --exclude='.vim/undodir'
mkdir -p "$HOME"/.vim/undodir
ln -sf .vim/vimrc "$HOME"/.vimrc

rsync -a --delete .zprezto "$HOME"
ln -sf .zprezto/runcoms/zlogin		"$HOME"/.zlogin
ln -sf .zprezto/runcoms/zpreztorc	"$HOME"/.zpreztorc
ln -sf .zprezto/runcoms/zprofile	"$HOME"/.zprofile
ln -sf .zprezto/runcoms/zshenv		"$HOME"/.zshenv
ln -sf .zprezto/runcoms/zshrc		"$HOME"/.zshrc
