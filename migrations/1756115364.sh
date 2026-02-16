echo "Replace buggy native Zoom client with webapp"

if subfrac-pkg-present zoom; then
  subfrac-pkg-drop zoom
  subfrac-webapp-install "Zoom" https://app.zoom.us/wc/home https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/zoom.png
fi
