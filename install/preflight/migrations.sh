SUBFRAC_MIGRATIONS_STATE_PATH=~/.local/state/subfrac/migrations
mkdir -p $SUBFRAC_MIGRATIONS_STATE_PATH

for file in ~/.local/share/subfrac/migrations/*.sh; do
  touch "$SUBFRAC_MIGRATIONS_STATE_PATH/$(basename "$file")"
done
