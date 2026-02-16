# Set links for Nautilius action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup theme links
mkdir -p ~/.config/subfrac/themes
for f in ~/.local/share/subfrac/themes/*; do ln -nfs "$f" ~/.config/subfrac/themes/; done

# Set initial theme
mkdir -p ~/.config/subfrac/current
ln -snf ~/.config/subfrac/themes/tokyo-night ~/.config/subfrac/current/theme
ln -snf ~/.config/subfrac/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/subfrac/current/background

# Set specific app links for current theme
# ~/.config/subfrac/current/theme/neovim.lua -> ~/.config/nvim/lua/plugins/theme.lua is handled via subfrac-setup-nvim

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/subfrac/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/subfrac/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium and Brave for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
