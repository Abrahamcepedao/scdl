#!/usr/bin/env bash
# Installs scdl's dependencies and links the script onto your PATH.
set -euo pipefail

cd "$(dirname "$0")"
brew install yt-dlp ffmpeg gum jq

mkdir -p "$HOME/.local/bin"
ln -sf "$PWD/scdl" "$HOME/.local/bin/scdl"
echo "✓ Linked $HOME/.local/bin/scdl → $PWD/scdl"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "! Add this to your ~/.zshrc:  export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac
