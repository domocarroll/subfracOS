echo "Fix JetBrains font setting"

if [[ $(subfrac-font-current) == JetBrains* ]]; then
  subfrac-font-set "JetBrainsMono Nerd Font"
fi
