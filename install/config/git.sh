# Set identification from install inputs
if [[ -n "${SUBFRAC_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$SUBFRAC_USER_NAME"
fi

if [[ -n "${SUBFRAC_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$SUBFRAC_USER_EMAIL"
fi
