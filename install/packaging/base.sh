# Install all base packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/subfrac-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
