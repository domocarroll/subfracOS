# Show installation environment variables
gum log --level info "Installation Environment:"

env | grep -E "^(SUBFRAC_CHROOT_INSTALL|SUBFRAC_ONLINE_INSTALL|SUBFRAC_USER_NAME|SUBFRAC_USER_EMAIL|USER|HOME|SUBFRAC_REPO|SUBFRAC_REF|SUBFRAC_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var"
done
