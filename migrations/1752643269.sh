echo "Add new matte black theme"

if [[ ! -L "~/.config/subfrac/themes/matte-black" ]]; then
  ln -snf ~/.local/share/subfrac/themes/matte-black ~/.config/subfrac/themes/
fi
