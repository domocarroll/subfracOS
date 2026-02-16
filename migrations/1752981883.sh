echo "Replace wofi with walker as the default launcher"

if subfrac-cmd-missing walker; then
  subfrac-pkg-add walker-bin libqalculate

  subfrac-pkg-drop wofi
  rm -rf ~/.config/wofi

  mkdir -p ~/.config/walker
  cp -r ~/.local/share/subfrac/config/walker/* ~/.config/walker/
fi
