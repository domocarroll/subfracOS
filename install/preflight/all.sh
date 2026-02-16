source $SUBFRAC_INSTALL/preflight/guard.sh
source $SUBFRAC_INSTALL/preflight/begin.sh
run_logged $SUBFRAC_INSTALL/preflight/show-env.sh
run_logged $SUBFRAC_INSTALL/preflight/pacman.sh
run_logged $SUBFRAC_INSTALL/preflight/migrations.sh
run_logged $SUBFRAC_INSTALL/preflight/first-run-mode.sh
run_logged $SUBFRAC_INSTALL/preflight/disable-mkinitcpio.sh
