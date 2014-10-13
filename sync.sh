#!/bin/bash

mkdir -p "$HOME/.config"

rsync -a --delete '.config/htop' "$HOME/.config"
rsync -a --delete '.config/screen.conf' "$HOME/.config"

rsync -a --delete '.config/zsh' "$HOME/.config" --exclude='zsh/.zdirs' --exclude='zsh/.zhistory'
ln -sf '.zprezto/runcoms/zshenv' "$HOME/.config/zsh/.zprezto/runcoms/zshenv"
