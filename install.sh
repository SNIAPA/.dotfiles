#!/bin/bash
pushd "$(dirname "$0")"

configs=("scripts" "dunst" "i3" "i3status" "picom" "conky" "wallpapers" "rofi" "nvim" "alacritty" "git" "lazygit")

for config in "${configs[@]}"; do 

  echo "linking ${config}"
  unlink "$(realpath ~/'.config')/${config}" 2> /dev/null
  ln -s $(realpath ./"${config}") $(realpath ~/".config/") 

done
echo "linking tmux"
rm -rf $(realpath ~/)"/.tmux.conf"
ln -s $(realpath ./"tmux/.tmux.conf") $(realpath ~/)"/.tmux.conf"
echo "linking zsh"
rm -rf $(realpath ~/)"/.zshrc"
ln -s $(realpath ./"zsh/.zshrc") $(realpath ~/)"/.zshrc"

echo "DONE"
