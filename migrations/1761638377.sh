echo "Turn off fcitx5 clipboard that is interferring with other applications"

mkdir -p ~/.config/fcitx5/conf
cp $SUBFRAC_PATH/config/fcitx5/conf/clipboard.conf ~/.config/fcitx5/conf/

subfrac-restart-xcompose
