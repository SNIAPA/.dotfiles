pushd "$(dirname "$0")"

configs=("i3" "picom" "polybar" "conky" "wallpapers" "rofi" "nvim" "alacritty")

for config in "${configs[@]}"; do 

  if [ -e $(realpath ~/".config/${config}") ]
  then
    echo "${config} config already exists" 
  else 
    ln -s $(realpath ./"${config}") $(realpath ~/".config/${config}")
  fi

done

