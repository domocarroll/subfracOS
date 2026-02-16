echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/subfrac/themes/osaka-jade ]]; then
  rm -rf ~/.config/subfrac/themes/osaka-jade
  git -C ~/.local/share/subfrac checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/subfrac/themes/osaka-jade ~/.config/subfrac/themes/osaka-jade
fi
