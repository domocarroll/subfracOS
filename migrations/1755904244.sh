echo "Update fastfetch config with new subfracOS logo"

subfrac-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/subfrac/branding
cp $SUBFRAC_PATH/icon.txt ~/.config/subfrac/branding/about.txt
