echo "Add subfracOS Package Repository"

subfrac-refresh-pacman-mirrorlist

if ! grep -q "subfrac" /etc/pacman.conf; then
  sudo sed -i '/^\[core\]/i [subfrac]\nSigLevel = Optional TrustAll\nServer = https:\/\/pkgs.omarchy.org\/$arch\n' /etc/pacman.conf
  sudo systemctl restart systemd-timesyncd
  sudo pacman -Syu --noconfirm
fi
