# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/subfrac/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$SUBFRAC_USER_NAME"
<Multi_key> <space> <e> : "$SUBFRAC_USER_EMAIL"
EOF
