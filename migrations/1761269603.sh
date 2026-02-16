echo "Add right-click terminal action to waybar omarchy menu icon"

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"

if [[ -f "$WAYBAR_CONFIG" ]] && ! grep -A5 '"custom/subfrac"' "$WAYBAR_CONFIG" | grep -q '"on-click-right"'; then
  sed -i '/"on-click": "subfrac-menu",/a\    "on-click-right": "subfrac-launch-terminal",' "$WAYBAR_CONFIG"
  subfrac-state set restart-waybar-required
fi
