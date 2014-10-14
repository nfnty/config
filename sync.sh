#!/bin/bash

mkdir -p "$HOME/.config"

rsync -a --delete '.config/htop' "$HOME/.config"
rsync -a --delete '.config/screen.conf' "$HOME/.config"

rsync -a --delete '.config/zsh' "$HOME/.config" --exclude='zsh/.zdirs' --exclude='zsh/.zhistory'
ln -sf ".config/zsh/.zprezto/runcoms/zshenv" "$HOME/.zshenv"

chown -R "$UID:$UID" "$HOME/.config"
