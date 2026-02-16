echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/subfrac/themes/ristretto ]]; then
  ln -nfs ~/.local/share/subfrac/themes/ristretto ~/.config/subfrac/themes/
fi
