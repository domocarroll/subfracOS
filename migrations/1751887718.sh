echo "Install Impala as new wifi selection TUI"

if subfrac-cmd-missing impala; then
  subfrac-pkg-add impala
  subfrac-refresh-waybar
fi
