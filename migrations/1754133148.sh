echo "Update Waybar CSS to dim unused workspaces"

if ! grep -q "#workspaces button\.empty" ~/.config/waybar/style.css; then
  subfrac-refresh-config waybar/style.css
  subfrac-restart-waybar
fi
