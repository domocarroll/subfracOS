echo "Adding subfracOS version info to fastfetch"
if ! grep -q "subfrac" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/subfrac/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

