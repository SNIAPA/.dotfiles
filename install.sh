pushd .
ln $(realpath picom.conf) $(realpath ~/.config/picom.conf) -s
ln $(realpath zsh/.zshrc) $(realpath ~/.zshrc) -s
ln $(realpath polybar) $(realpath ~/.config/polybar) -s
ln $(realpath nvim) $(realpath ~/.config/nvim) -s
ln $(realpath i3) $(realpath ~/.config/i3) -s
ln $(realpath rofi) $(realpath ~/.config/rofi) -s
ln $(realpath alacritty) $(realpath ~/.config/alacritty) -s
ln $(realpath conky) $(realpath ~/.config/conky) -s

find . -type l | sed -e s'/^\.\///g' > .gitignore

nitrogen --set-auto wallpaper.png --save
