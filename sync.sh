#!/bin/bash
mkdir -p ~/.config
rsync -a --delete .config/htop ~/.config/htop

rsync -a --delete .vim ~/.vim --exclude='/undodir'
ln -sf .vim/vimrc ~/.vimrc

rsync -a --delete .zprezto ~/.zprezto
ln -sf .zprezto/runcoms/zlogin		~/.zlogin
ln -sf .zprezto/runcoms/zpreztorc	~/.zpreztorc
ln -sf .zprezto/runcoms/zprofile	~/.zprofile
ln -sf .zprezto/runcoms/zshenv		~/.zshenv
ln -sf .zprezto/runcoms/zshrc		~/.zshrc
