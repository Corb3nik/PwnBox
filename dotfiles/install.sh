#!/bin/bash

dotfiles=(
  aliases bash_prompt exports
  vimrc
  bash_colors bashrc vim
)

echo "[*] Linking new dotfiles..."
curr_folder=`pwd`
for f in ${dotfiles[@]}; do
  cp -R $curr_folder/$f $HOME/.$f
done
echo "[*] Done"
