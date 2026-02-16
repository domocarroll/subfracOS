echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/subfrac-cmd-tzupdate/subfrac-launch-floating-terminal-with-presentation subfrac-tz-select/g' ~/.config/waybar/config.jsonc
