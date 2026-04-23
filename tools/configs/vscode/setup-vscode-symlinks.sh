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

# Backup existing item if it is a real file/folder (not already a symlink)
backup_if_real() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    local backup="${target}.bak.$(date +%Y%m%d-%H%M%S)"
    echo "Backing up existing item:"
    echo "  $target -> $backup"
    mv "$target" "$backup"
  fi
}

# Symlink helper — verifies source exists before linking
link_item() {
  local src="$1"
  local dest="$2"
  if [ ! -e "$src" ]; then
    echo "ERROR: Source not found, skipping:"
    echo "  $src"
    return 1
  fi
  echo "Linking:"
  echo "  $src -> $dest"
  ln -sf "$src" "$dest"
}

# settings.json
backup_if_real "$VSCODE_USER_DIR/settings.json"
link_item "$REPO_VSCODE_DIR/settings.json" "$VSCODE_USER_DIR/settings.json"

# keybindings.json
backup_if_real "$VSCODE_USER_DIR/keybindings.json"
link_item "$REPO_VSCODE_DIR/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

# snippets/ folder
backup_if_real "$VSCODE_USER_DIR/snippets"
link_item "$REPO_VSCODE_DIR/snippets" "$VSCODE_USER_DIR/snippets"

echo
echo "Done. Restart VS Code if it was open."
