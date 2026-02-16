echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/subfrac/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/subfrac/themes/catppuccin-latte ~/.config/subfrac/themes/
fi
