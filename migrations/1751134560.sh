echo "Add UWSM env"

export SUBFRAC_PATH="$HOME/.local/share/subfrac"
export PATH="$SUBFRAC_PATH/bin:$PATH"

mkdir -p "$HOME/.config/uwsm/"
cat <<EOF | tee "$HOME/.config/uwsm/env"
export SUBFRAC_PATH=$HOME/.local/share/subfrac
export PATH=$SUBFRAC_PATH/bin/:$PATH
EOF

mkdir -p ~/.local/state/subfrac/migrations
touch ~/.local/state/subfrac/migrations/1751134560.sh

sudo systemctl restart systemd-timesyncd
bash subfrac-update-perform
