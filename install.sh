#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define subfracOS locations
export SUBFRAC_PATH="$HOME/.local/share/subfrac"
export SUBFRAC_INSTALL="$SUBFRAC_PATH/install"
export SUBFRAC_INSTALL_LOG_FILE="/var/log/subfrac-install.log"
export PATH="$SUBFRAC_PATH/bin:$PATH"

# Install
source "$SUBFRAC_INSTALL/helpers/all.sh"
source "$SUBFRAC_INSTALL/preflight/all.sh"
source "$SUBFRAC_INSTALL/packaging/all.sh"
source "$SUBFRAC_INSTALL/config/all.sh"
source "$SUBFRAC_INSTALL/login/all.sh"
source "$SUBFRAC_INSTALL/post-install/all.sh"
