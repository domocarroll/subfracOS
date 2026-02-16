echo "Install swayOSD to show volume status"

if subfrac-cmd-missing swayosd-server; then
  subfrac-pkg-add swayosd
  setsid uwsm-app -- swayosd-server &>/dev/null &
fi
