echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/subfrac/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/subfrac/themes/flexoki-light ~/.config/subfrac/themes/
fi
