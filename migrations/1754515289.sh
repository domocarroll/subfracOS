echo "Update and restart Walker to resolve stuck subfracOS menu"

sudo pacman -Syu --noconfirm walker-bin
subfrac-restart-walker
