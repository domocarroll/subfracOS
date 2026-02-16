echo "Migrate to proper packages for localsend and asdcontrol"

if subfrac-pkg-present localsend-bin; then
  subfrac-pkg-drop localsend-bin
  subfrac-pkg-add localsend
fi

if subfrac-pkg-present asdcontrol-git; then
  subfrac-pkg-drop asdcontrol-git
  subfrac-pkg-add asdcontrol
fi
