echo "Allow updating of timezone by right-clicking on the clock (or running subfrac-cmd-tzupdate)"

if subfrac-cmd-missing tzupdate; then
  bash "$SUBFRAC_PATH/install/config/timezones.sh"
  subfrac-refresh-waybar
fi
