#!/bin/bash
pushd "$(dirname "$0")"

configs=("zsh" "i3" "picom" "conky" "wallpapers" "rofi" "nvim" "alacritty" "tmux")

for config in "${configs[@]}"; do 

  echo "linking ${config}"
  unlink "$(realpath ~/'.config')/${config}"
  ln -s $(realpath ./"${config}") $(realpath ~/".config/") 

done

echo "DONE"
