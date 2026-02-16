#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export SUBFRAC_ONLINE_INSTALL=true

ansi_art='
 ▄█████▄    ▄█   █▄   ▄██████▄   ▄████████  ▄██████▄    ▄█████▄    ▄█████▄
███   ███  ███   ███  ███   ███  ███   ▀▀▀  ███   ███  ███   ███  ███   ███
███        ███   ███  ███   ███  ███        ███   ███  ███   ███  ███   █▀
 ▀█████▄   ███   ███  ████████▀  ███████    ████████▀  █████████  ███
      ███  ███   ███  ████████▄  ███▀▀▀     ██████▀    ███▀▀▀███  ███
      ███  ███   ███  ███   ███  ███        ███ ███    ███   ███  ███   █▄
███   ███  ███   ███  ███   ███  ███        ███  ███   ███   ███  ███   ███
 ▀█████▀    ▀█████▀   ▀██████▀   ███        ███   ███  ███   ███   ▀█████▀
'

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to domocarroll/subfracOS
SUBFRAC_REPO="${SUBFRAC_REPO:-domocarroll/subfracOS}"

echo -e "\nCloning subfracOS from: https://github.com/${SUBFRAC_REPO}.git"
rm -rf ~/.local/share/subfrac/
git clone "https://github.com/${SUBFRAC_REPO}.git" ~/.local/share/subfrac >/dev/null

# Use custom branch if instructed, otherwise default to master
SUBFRAC_REF="${SUBFRAC_REF:-master}"
if [[ $SUBFRAC_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $SUBFRAC_REF\e[0m"
  cd ~/.local/share/subfrac
  git fetch origin "${SUBFRAC_REF}" && git checkout "${SUBFRAC_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/subfrac/install.sh
