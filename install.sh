#!/bin/bash
pushd "$(dirname "$0")"

configs=("i3" "picom" "polybar" "conky" "wallpapers" "rofi" "nvim" "alacritty")

for config in "${configs[@]}"; do 

  if [ -e $(realpath ~/".config/${config}") ]
  then
    echo "${config} config already exists relinking" 
		rm -rdf $(realpath ~/".config/${config}")
  fi
  ln -s $(realpath ./"${config}") $(realpath ~/".config/${config}")

done

