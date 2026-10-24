#!/usr/bin/env bash
# Installs scdl's dependencies and links the script onto your PATH.
set -euo pipefail

cd "$(dirname "$0")"
brew install yt-dlp ffmpeg gum jq

mkdir -p "$HOME/.local/bin"
for name in scdl sound; do
  ln -sf "$PWD/scdl" "$HOME/.local/bin/$name"
  echo "✓ Linked $HOME/.local/bin/$name → $PWD/scdl"
done

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "! Add this to your ~/.zshrc:  export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac
