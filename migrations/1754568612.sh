echo "Update Waybar config to fix path issue with update-available icon click"

if grep -q "alacritty --class Omarchy --title Omarchy -e subfrac-update" ~/.config/waybar/config.jsonc; then
  sed -i 's|\("on-click": "alacritty --class Omarchy --title Omarchy -e \)subfrac-update"|\1subfrac-update"|' ~/.config/waybar/config.jsonc
  subfrac-restart-waybar
fi
