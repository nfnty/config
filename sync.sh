#!/bin/bash
mkdir -p ~/.config
rsync -a --delete .config/htop ~/.config

rsync -a --delete .vim ~ --exclude='/undodir'
ln -sf .vim/vimrc ~/.vimrc

rsync -a --delete .zprezto ~
ln -sf .zprezto/runcoms/zlogin		~/.zlogin
ln -sf .zprezto/runcoms/zpreztorc	~/.zpreztorc
ln -sf .zprezto/runcoms/zprofile	~/.zprofile
ln -sf .zprezto/runcoms/zshenv		~/.zshenv
ln -sf .zprezto/runcoms/zshrc		~/.zshrc
