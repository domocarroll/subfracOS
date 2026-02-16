echo "Start screensaver automatically after 1 minute and stop before locking"

if ! grep -q "subfrac-launch-screensaver" ~/.config/hypr/hypridle.conf; then
  subfrac-refresh-hypridle
  subfrac-refresh-hyprlock
fi
