echo "Change to openai-codex instead of openai-codex-bin"

if subfrac-pkg-present openai-codex-bin; then
    subfrac-pkg-drop openai-codex-bin
    subfrac-pkg-add openai-codex
fi
