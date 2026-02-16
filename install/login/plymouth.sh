if [ "$(plymouth-set-default-theme)" != "subfrac" ]; then
  sudo cp -r "$HOME/.local/share/subfrac/default/plymouth" /usr/share/plymouth/themes/subfrac/
  sudo plymouth-set-default-theme subfrac
fi
