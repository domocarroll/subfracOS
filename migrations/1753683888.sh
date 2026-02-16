echo "Adding Omarchy version info to fastfetch"
if ! grep -q "omarchy" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/subfrac/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

