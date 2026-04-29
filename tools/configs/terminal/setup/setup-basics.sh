#!/usr/bin/env bash

set -euo pipefail

GREEN="\\033[32m"
YELLOW="\\033[33m"
CYAN="\\033[36m"
RESET="\\033[0m"

# Core paths
DREEMDEV_ROOT="$HOME/dev/dreemdev"
PY_PLAYGROUND="$DREEMDEV_ROOT/projects/python/playground"
R_PLAYGROUND="$DREEMDEV_ROOT/projects/r/playground"

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

setup_dev_folders() {
  echo -e "${CYAN}=== Setting up dev folder structure ===${RESET}"

  mkdir -p "$HOME/dev/projects"
  mkdir -p "$HOME/dev/learning"
  mkdir -p "$HOME/dev/dreemdev"
  mkdir -p "$HOME/dev/temp"
  mkdir -p "$HOME/dev/archive"

  echo "Created/verified base folder structure under ~/dev:"
  echo "  - ~/dev/projects"
  echo "  - ~/dev/learning"
  echo "  - ~/dev/dreemdev"
  echo "  - ~/dev/temp"
  echo "  - ~/dev/archive"
  echo -e "${GREEN}Dev folders ready.${RESET}"
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
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
      # shellcheck source=/dev/null
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi
}

install_dev_languages() {
  echo -e "${CYAN}=== Installing Python & R via Homebrew ===${RESET}"

  if ! command -v brew >/dev/null 2>&1; then
    echo -e "${YELLOW}Homebrew not available; skipping language installation.${RESET}"
    return
  fi

  if confirm "Install/upgrade Homebrew python (python 3.x)?"; then
    brew install python || brew upgrade python || true
  fi

  if confirm "Install/upgrade R (CLI, via Homebrew)?"; then
    brew install r || brew upgrade r || true
  fi

  echo -e "${GREEN}Language installation step complete.${RESET}"
}

install_ohmyzsh_and_plugins() {
  echo -e "${CYAN}=== Installing Oh My Zsh and plugins ===${RESET}"

  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Oh My Zsh not found; installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || {
      echo -e "${YELLOW}Oh My Zsh installation failed or was interrupted.${RESET}"
    }
  else
    echo "Oh My Zsh already installed at ~/.oh-my-zsh"
  fi

  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${YELLOW}Skipping plugin install because ~/.oh-my-zsh is missing.${RESET}"
    return
  fi

  local zsh_custom
  zsh_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  echo "Ensuring zsh-autosuggestions is installed..."
  if [[ ! -d "$zsh_custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions \
      "$zsh_custom/plugins/zsh-autosuggestions" || \
      echo -e "${YELLOW}Failed to clone zsh-autosuggestions.${RESET}"
  else
    echo "zsh-autosuggestions already present."
  fi

  echo "Ensuring zsh-syntax-highlighting is installed..."
  if [[ ! -d "$zsh_custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$zsh_custom/plugins/zsh-syntax-highlighting" || \
      echo -e "${YELLOW}Failed to clone zsh-syntax-highlighting.${RESET}"
  else
    echo "zsh-syntax-highlighting already present."
  fi

  echo -e "${GREEN}Oh My Zsh and plugins step complete. Make sure your .zshrc has the proper theme/plugins block with a safety guard.${RESET}"
}

install_aldente() {
  echo -e "${CYAN}=== Installing AlDente (battery management) ===${RESET}"

  if ! command -v brew >/dev/null 2>&1; then
    echo -e "${YELLOW}Homebrew not available; skipping AlDente installation.${RESET}"
    return
  fi

  if brew list --cask aldente &>/dev/null; then
    echo "AlDente already installed."
  else
    if confirm "Install AlDente (battery charge limiter)?"; then
      brew install --cask aldente
      echo -e "${GREEN}AlDente installed.${RESET}"
    fi
  fi

  echo -e "${CYAN}--- AlDente Optimal Config Reminder ---${RESET}"
  echo "  1. Set Charge Limit to 80% (or 60-70% if mostly at desk)"
  echo "  2. Enable Sailing Mode with range 75-80%"
  echo "  3. Schedule a monthly calibration (full cycle)"
  echo "  4. Consider AlDente Pro for heat protection & automation"
  echo -e "${YELLOW}Launch AlDente from Applications and follow the onboarding.${RESET}"
}

install_bandwhich() {
  echo -e "${CYAN}=== Installing bandwhich (network & data monitor) ===${RESET}"


  if ! command -v brew >/dev/null 2>&1; then
    echo -e "${YELLOW}Homebrew not available; skipping bandwhich installation.${RESET}"
    return
  fi


  if brew list bandwhich &>/dev/null; then
    echo "bandwhich already installed."
  else
    if confirm "Install bandwhich (terminal bandwidth monitor)?"; then
      brew install bandwhich
      echo -e "${GREEN}bandwhich installed.${RESET}"
    fi
  fi


  echo -e "${CYAN}--- bandwhich Usage Reminder ---${RESET}"
  echo "  All commands require sudo (raw socket access):"
  echo "  1. bwsession    → timestamped hotspot session tracker (auto-detects interface)"
  echo "  2. bwt          → cumulative session totals, all interfaces"
  echo "  3. bwwifi       → cumulative totals, Wi-Fi only (en0)"
  echo "  4. bw           → live bandwidth by process"
  echo "  5. bwtn         → cumulative totals, no DNS (cleanest output)"
  echo -e "${YELLOW}Run 'zhelp' and see NETWORK & DATA MONITOR for the full alias list.${RESET}"
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

clone_dreemdev() {
  echo -e "${CYAN}=== Cloning dreemdev repo (forever repo) ===${RESET}"

  if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}git not available; skipping dreemdev clone.${RESET}"
    return
  fi

  if [[ -d "$DREEMDEV_ROOT/.git" ]]; then
    echo "dreemdev already exists at $DREEMDEV_ROOT"
    return
  fi

  mkdir -p "$DREEMDEV_ROOT"
  local url
  url="$(prompt 'dreemdev SSH clone URL' 'git@github.com:ETA444/dreemdev.git')"

  echo "Cloning dreemdev into $DREEMDEV_ROOT from $url ..."
  git clone "$url" "$DREEMDEV_ROOT" || {
    echo -e "${YELLOW}Failed to clone dreemdev. You can clone it manually later and rerun relevant steps.${RESET}"
    return
  }

  echo -e "${GREEN}dreemdev clone complete.${RESET}"
}

deploy_zshrc_from_repo() {
  echo -e "${CYAN}=== Deploying .zshrc from dreemdev/dotfiles ===${RESET}"

  if [[ ! -d "$DREEMDEV_ROOT" ]]; then
    echo -e "${YELLOW}dreemdev not found at $DREEMDEV_ROOT. Clone it first, then rerun this step.${RESET}"
    return
  fi

  local repo_zshrc="$DREEMDEV_ROOT/dotfiles/.zshrc"
  local target_zshrc="$HOME/.zshrc"

  if [[ ! -f "$repo_zshrc" ]]; then
    echo -e "${YELLOW}No $repo_zshrc found. Skipping .zshrc deployment.${RESET}"
    return
  fi

  if [[ -f "$target_zshrc" && ! -L "$target_zshrc" ]]; then
    local backup="$target_zshrc.backup.$(date +%Y%m%d-%H%M%S)"
    echo "Backing up existing ~/.zshrc to $backup"
    cp "$target_zshrc" "$backup"
  fi

  ln -sf "$repo_zshrc" "$target_zshrc"
  echo "Symlinked $target_zshrc -> $repo_zshrc"

  if confirm "Source ~/.zshrc now in this shell?"; then
    # shellcheck source=/dev/null
    source "$target_zshrc"
  fi

  echo -e "${GREEN}.zshrc deployment complete.${RESET}"
}

setup_python_playground() {
  echo -e "${CYAN}=== Python playground venv setup ===${RESET}"

  if [[ ! -d "$PY_PLAYGROUND" ]]; then
    echo -e "${YELLOW}Python playground directory not found at $PY_PLAYGROUND. Skipping.${RESET}"
    return
  fi

  if ! command -v python3 >/dev/null 2>&1; then
    echo -e "${YELLOW}python3 not available; install it via Homebrew first.${RESET}"
    return
  fi

  cd "$PY_PLAYGROUND"

  if [[ ! -f "requirements.txt" ]]; then
    echo -e "${YELLOW}No requirements.txt in $PY_PLAYGROUND; skipping venv setup.${RESET}"
    return
  fi

  rm -rf venv
  python3 -m venv venv
  # shellcheck source=/dev/null
  source venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  deactivate

  echo -e "${GREEN}Python playground venv ready (using Homebrew Python).${RESET}"
}

setup_r_playground() {
  echo -e "${CYAN}=== R playground renv setup ===${RESET}"

  if [[ ! -d "$R_PLAYGROUND" ]]; then
    echo -e "${YELLOW}R playground directory not found at $R_PLAYGROUND. Skipping.${RESET}"
    return
  fi

  if ! command -v R >/dev/null 2>&1; then
    echo -e "${YELLOW}R not available; install it via Homebrew first.${RESET}"
    return
  fi

  cd "$R_PLAYGROUND"

  if [[ -f "renv.lock" ]]; then
    R -e 'install.packages("renv"); renv::restore()'
  elif [[ -f "requirements.R" ]]; then
    R -e 'install.packages("renv"); renv::init(); source("requirements.R"); renv::snapshot()'
  else
    echo -e "${YELLOW}No renv.lock or requirements.R found; skipping R env setup.${RESET}"
    return
  fi

  echo -e "${GREEN}R playground environment ready via renv.${RESET}"
}

clone_repos() {
  echo -e "${CYAN}=== Optionally cloning additional GitHub repos ===${RESET}"

  if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}git not available; skipping cloning.${RESET}"
    return
  fi

  local github_user
  github_user="$(prompt 'Your GitHub username' 'ETA444')"

  echo "You can now add repos one by one."
  echo "For each repo, you'll choose whether it belongs under projects, learning, or dreemdev."
  echo "Leave the repo name empty to stop."

  while true; do
    local repo
    repo="$(prompt 'Repo name to clone (empty to finish)' '')"
    if [[ -z "$repo" ]]; then
      break
    fi

    echo "Where should '$repo' live?"
    echo "1) ~/dev/projects"
    echo "2) ~/dev/learning"
    echo "3) ~/dev/dreemdev"
    local choice
    choice="$(prompt 'Choose 1, 2, or 3' '1')"

    local base_dir
    case "$choice" in
      2) base_dir="$HOME/dev/learning" ;;
      3) base_dir="$HOME/dev/dreemdev" ;;
      *) base_dir="$HOME/dev/projects" ;;
    esac

    mkdir -p "$base_dir"
    cd "$base_dir"

    if [[ -d "$repo" ]]; then
      echo "Directory '$base_dir/$repo' already exists, skipping clone."
      continue
    fi

    local url="git@github.com:${github_user}/${repo}.git"
    echo "Cloning $url into $base_dir/$repo ..."
    if ! git clone "$url"; then
      echo -e "${YELLOW}Failed to clone ${repo}.${RESET}"
    fi
  done

  echo -e "${GREEN}Additional repo cloning step complete.${RESET}"
}

main() {
  echo -e "${GREEN}New Mac dev setup script starting...${RESET}"

  if confirm "Run dev folder structure setup?"; then
    setup_dev_folders
  fi

  if confirm "Check/install Xcode Command Line Tools?"; then
    install_xcode_clt
  fi

  if confirm "Check/install Homebrew?"; then
    install_homebrew
  fi

  if confirm "Install Python & R via Homebrew?"; then
    install_dev_languages
  fi

  if confirm "Install Oh My Zsh with autosuggestions and syntax highlighting?"; then
    install_ohmyzsh_and_plugins
  fi

  if confirm "Install AlDente (battery charge limiter)?"; then
    install_aldente
  fi

  if confirm "Install bandwhich (network & data monitor)?"; then
    install_bandwhich
  fi

  if confirm "Configure global git user.name, user.email and editor?"; then
    configure_git
  fi

  if confirm "Setup SSH key and connect to GitHub?"; then
    setup_ssh_key
  fi

  if confirm "Clone dreemdev repo via SSH?"; then
    clone_dreemdev
  fi

  if confirm "Deploy ~/.zshrc from dreemdev/dotfiles (if present)?"; then
    deploy_zshrc_from_repo
  fi

  if confirm "Setup Python playground venv (if dreemdev python playground exists)?"; then
    setup_python_playground
  fi

  if confirm "Setup R playground renv (if dreemdev R playground exists)?"; then
    setup_r_playground
  fi

  if confirm "Clone additional GitHub repos (learning/projects/dreemdev)?"; then
    clone_repos
  fi

  echo -e "${GREEN}All selected setup steps completed.${RESET}"
}

# Zsh-safe guard: run main only when script is executed directly, not sourced.
# Works in both Bash (BASH_SOURCE) and Zsh (ZSH_EVAL_CONTEXT).
if [[ -n "${BASH_SOURCE[0]-}" && "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main
elif [[ -z "${BASH_SOURCE[0]-}" && "${ZSH_EVAL_CONTEXT-}" == "toplevel" ]]; then
  main
fi
