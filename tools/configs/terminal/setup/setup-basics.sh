#!/usr/bin/env bash

set -euo pipefail

GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

prompt() {
  local prompt_text="$1"
  local default="${2-}"
  local var
  if [[ -n "$default" ]]; then
    read -r -p "$prompt_text [$default]: " var
    var="${var:-$default}"
  else
    read -r -p "$prompt_text: " var
  fi
  echo "$var"
}

confirm() {
  local prompt_text="$1"
  read -r -p "$prompt_text [Y/n]: " reply
  reply="${reply:-Y}"
  if [[ "$reply" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

append_if_missing() {
  local line="$1"
  local file="$2"
  grep -qxF "$line" "$file" 2>/dev/null || echo "$line" >> "$file"
}

setup_dev_folders_and_aliases() {
  echo -e "${CYAN}=== Setting up dev folder structure and aliases ===${RESET}"

  mkdir -p "$HOME/dev/projects/datasafari"
  mkdir -p "$HOME/dev/projects/dreemcorp"
  mkdir -p "$HOME/dev/projects/georgedreemer.com"
  mkdir -p "$HOME/dev/learning/1month-learning"
  mkdir -p "$HOME/dev/learning/datacamp-learning"
  mkdir -p "$HOME/dev/dreemdev"
  mkdir -p "$HOME/dev/temp"
  mkdir -p "$HOME/dev/archive"

  echo "Created/verified folder structure under ~/dev"

  local zshrc="$HOME/.zshrc"
  touch "$zshrc"

  append_if_missing "alias dev='cd ~/dev'" "$zshrc"
  append_if_missing "alias build='cd ~/dev/projects'" "$zshrc"
  append_if_missing "alias learn='cd ~/dev/learning'" "$zshrc"
  append_if_missing "alias practice='cd ~/dev/dreemdev'" "$zshrc"

  echo "Aliases added to $zshrc (available in new shells)."
  if confirm "Source ~/.zshrc now in this shell?"; then
    # shellcheck source=/dev/null
    source "$zshrc"
  fi

  echo -e "${GREEN}Dev folders and aliases ready.${RESET}"
}

install_xcode_clt() {
  echo -e "${CYAN}=== Checking Xcode Command Line Tools ===${RESET}"
  if xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools already installed."
  else
    echo "Xcode Command Line Tools not found."
    if confirm "Install Xcode Command Line Tools now? (macOS will show a popup)"; then
      xcode-select --install || true
      echo -e "${YELLOW}Wait for the installation popup to finish, then come back here.${RESET}"
      read -r -p "Press Enter once Xcode Command Line Tools installation has completed..."
    fi
  fi
}

install_homebrew() {
  echo -e "${CYAN}=== Checking Homebrew ===${RESET}"
  if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed: $(brew --version | head -n 1)"
  else
    echo "Homebrew not found."
    if confirm "Install Homebrew now?"; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo "Homebrew installed."
    fi
  fi
}

configure_git() {
  echo -e "${CYAN}=== Git basic configuration ===${RESET}"
  if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}git is not available yet. Make sure Xcode CLT are installed.${RESET}"
    return
  fi

  echo "Current git version:"
  git --version

  FULL_NAME="$(prompt 'Git user.name' 'George Dreemer')"
  EMAIL="$(prompt 'Git user.email' 'you@example.com')"
  EDITOR_CHOICE="$(prompt 'Default git editor' 'nano')"

  git config --global user.name "$FULL_NAME"
  git config --global user.email "$EMAIL"
  git config --global core.editor "$EDITOR_CHOICE"

  echo "Git global configuration set:"
  git config --global --get user.name
  git config --global --get user.email
  git config --global --get core.editor
}

setup_ssh_key() {
  echo -e "${CYAN}=== SSH key for GitHub ===${RESET}"

  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"

  local key_path="$HOME/.ssh/id_ed25519"

  if [[ -f "$key_path" ]]; then
    echo "An SSH key already exists at $key_path."
    if ! confirm "Generate a NEW SSH key and overwrite the existing one?"; then
      echo "Using existing key."
    else
      echo -e "${YELLOW}Generating new Ed25519 SSH key. You will be prompted for a passphrase.${RESET}"
      ssh-keygen -t ed25519 -C "$EMAIL" -f "$key_path"
    fi
  else
    echo -e "${YELLOW}Generating Ed25519 SSH key (you will be prompted for a passphrase).${RESET}"
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$key_path"
  fi

  echo "Starting ssh-agent and adding the key..."
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add "$key_path"
  ssh-add -l

  echo "Copying public key to clipboard and printing it for reference:"
  pbcopy < "${key_path}.pub"
  echo "------------------ PUBLIC KEY BEGIN ------------------"
  cat "${key_path}.pub"
  echo "------------------- PUBLIC KEY END -------------------"
  echo
  echo "Add this key to GitHub:"
  echo "  1. Open https://github.com in your browser."
  echo "  2. Click your avatar → Settings."
  echo "  3. Go to 'SSH and GPG keys'."
  echo "  4. Click 'New SSH key', give it a name, paste the key, and save."
  echo
  read -r -p "Press Enter AFTER you have added this key to GitHub..."

  echo "Testing SSH connection to GitHub (you may be asked to confirm GitHub's fingerprint)..."
  ssh -T git@github.com || true
}

clone_repos() {
  echo -e "${CYAN}=== Cloning GitHub repos ===${RESET}"

  if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}git not available; skipping cloning.${RESET}"
    return
  fi

  GITHUB_USER="$(prompt 'Your GitHub username' 'ETA444')"

  echo "Where should I clone your main repos?"
  echo "1) ~/dev/dreemdev"
  echo "2) ~/dev/projects"
  CLONE_BASE_CHOICE="$(prompt 'Choose 1 or 2' '1')"
  if [[ "$CLONE_BASE_CHOICE" == "2" ]]; then
    CLONE_BASE="$HOME/dev/projects"
  else
    CLONE_BASE="$HOME/dev/dreemdev"
  fi
  mkdir -p "$CLONE_BASE"

  if confirm "Clone dreemcorp repo (git@github.com:${GITHUB_USER}/dreemcorp.git)?"; then
    cd "$CLONE_BASE"
    if [[ -d "dreemcorp" ]]; then
      echo "Repository 'dreemcorp' already exists in $CLONE_BASE, skipping clone."
    else
      git clone "git@github.com:${GITHUB_USER}/dreemcorp.git"
    fi
    cd "dreemcorp" 2>/dev/null || true
    git status || true
  fi

  # Template for more repos – you can edit this before running if you like.
  if confirm "Clone any additional repos now (space-separated names)?"; then
    EXTRA_REPOS="$(prompt 'Enter repo names (e.g. datasafari georgedreemer.com)' '')"
    if [[ -n "$EXTRA_REPOS" ]]; then
      cd "$CLONE_BASE"
      for repo in $EXTRA_REPOS; do
        if [[ -d "$repo" ]]; then
          echo "Repo '$repo' already exists in $CLONE_BASE, skipping."
        else
          git clone "git@github.com:${GITHUB_USER}/${repo}.git" || echo "Failed to clone ${repo}."
        fi
      done
    fi
  fi

  echo -e "${GREEN}Repo cloning step complete.${RESET}"
}

main() {
  echo -e "${GREEN}New Mac dev setup script starting...${RESET}"

  if confirm "Run dev folder structure and alias setup?"; then
    setup_dev_folders_and_aliases
  fi

  if confirm "Check/install Xcode Command Line Tools?"; then
    install_xcode_clt
  fi

  if confirm "Check/install Homebrew?"; then
    install_homebrew
  fi

  if confirm "Configure global git user.name, user.email and editor?"; then
    configure_git
  fi

  if confirm "Setup SSH key and connect to GitHub?"; then
    setup_ssh_key
  fi

  if confirm "Clone your GitHub repos (dreemcorp, etc.)?"; then
    clone_repos
  fi

  echo -e "${GREEN}All selected setup steps completed.${RESET}"
}

main
