echo "Add eza themeing"

mkdir -p ~/.config/eza

if [ -f ~/.config/subfrac/current/theme/eza.yml ]; then
  ln -snf ~/.config/subfrac/current/theme/eza.yml ~/.config/eza/theme.yml
fi

