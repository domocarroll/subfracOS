echo "Change to omarchy-nvim package"
subfrac-pkg-drop omarchy-lazyvim
subfrac-pkg-add omarchy-nvim

# Will trigger to overwrite configs or not to pickup new hot-reload themes
omarchy-nvim-setup
