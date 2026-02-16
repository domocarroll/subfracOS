echo "Add minimal starship prompt to terminal"

if subfrac-cmd-missing starship; then
  subfrac-pkg-add starship
  cp $OMARCHY_PATH/config/starship.toml ~/.config/starship.toml
fi
