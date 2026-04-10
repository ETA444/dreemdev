#!/usr/bin/env bash
set -e

# Base paths
REPO_VSCODE_DIR="$HOME/dev/dreemdev/tools/configs/vscode"
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

echo "Symlinking VS Code config from:"
echo "  $REPO_VSCODE_DIR"
echo "to:"
echo "  $VSCODE_USER_DIR"
echo

# Ensure target directory exists
mkdir -p "$VSCODE_USER_DIR"

# Backup existing files if they are real files (not symlinks)
backup_file() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    local backup="${target}.bak.$(date +%Y%m%d-%H%M%S)"
    echo "Backing up existing file:"
    echo "  $target -> $backup"
    mv "$target" "$backup"
  fi
}

# Symlink helper
link_file() {
  local src="$1"
  local dest="$2"
  echo "Linking:"
  echo "  $src -> $dest"
  ln -sf "$src" "$dest"
}

# settings.json
backup_file "$VSCODE_USER_DIR/settings.json"
link_file "$REPO_VSCODE_DIR/settings.json" "$VSCODE_USER_DIR/settings.json"

# keybindings.json
backup_file "$VSCODE_USER_DIR/keybindings.json"
link_file "$REPO_VSCODE_DIR/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

echo
echo "Done. Restart VS Code if it was open."

