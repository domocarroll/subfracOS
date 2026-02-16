# Copy over subfracOS configs
mkdir -p ~/.config
cp -R ~/.local/share/subfrac/config/* ~/.config/

# Use default bashrc from subfracOS
cp ~/.local/share/subfrac/default/bashrc ~/.bashrc
