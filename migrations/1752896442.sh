echo "Replace volume control GUI with a TUI"

if subfrac-cmd-missing wiremix; then
  subfrac-pkg-add wiremix
  subfrac-pkg-drop pavucontrol
  subfrac-refresh-applications
  subfrac-refresh-waybar
fi
