echo "Update Waybar for new subfracOS menu"

if ! grep -q "" ~/.config/waybar/config.jsonc; then
  subfrac-refresh-waybar
fi
