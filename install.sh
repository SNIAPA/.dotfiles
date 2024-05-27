#!/bin/bash
pushd "$(dirname "$0")"

configs=("zsh" "i3" "i3status" "picom" "conky" "wallpapers" "rofi" "nvim" "alacritty")

for config in "${configs[@]}"; do 

  echo "linking ${config}"
  unlink "$(realpath ~/'.config')/${config}"
  ln -s $(realpath ./"${config}") $(realpath ~/".config/") 

done
echo "linking tmux"
rm -rf $(realpath ~/)"/.tmux.conf"
ln -s $(realpath ./"tmux/.tmux.conf") $(realpath ~/)"/.tmux.conf"

echo "DONE"
