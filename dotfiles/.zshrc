# ==========================
# oh-my-zsh
# ==========================
# Oh My Zsh setup (safe if not installed yet)
export ZSH="$HOME/.oh-my-zsh"

if [ -d "$ZSH" ]; then
  ZSH_THEME="steeef"

  plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
  )

  source "$ZSH/oh-my-zsh.sh"
fi

# ==========================
# Core helpers
# ==========================

# Edit zsh config and reload
alias zconfig='nano ~/dev/dreemdev/dotfiles/.zshrc && source ~/.zshrc'

# Quick commit zshrc to dreemdev (for small changes / generic commit message)
alias zcommit="cd ~/dev/dreemdev/dotfiles && git add .zshrc && git commit -m 'Update .zshrc' && git status"

# Show where ~/.zshrc points (symlink check)
alias zlink='ls -l ~/.zshrc'

# Quick navigation
alias home='cd ~ && ls'
alias desktop='cd ~/Desktop && ls'
alias downloads='cd ~/Downloads && ls'
alias dev='cd ~/dev && ls'
alias build='cd ~/dev/projects && ls'
alias learn='cd ~/dev/learning && ls'
alias dreemdev='cd ~/dev/dreemdev && ls'

# ==========================
# Shell QoL
# ==========================

# Better ls
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -lh'

# Quick up-directory
alias ..='cd .. && ls'
alias ...='cd ../.. && ls'
alias ....='cd ../../.. && ls'

# Clear terminal
alias c='clear'

# Tree-like view without installing tree:
# Shows a simple ASCII tree of the current directory
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


# ==========================
# App control (osascript)
# ==========================

# List all currently visible running apps (foreground only, no background daemons)
alias apps="osascript -e 'tell application \"System Events\" to get the name of every process whose background only is false' | tr ',' '\n' | sed 's/^ //' | sort"

# Quit a specific app by name: qapp "Comet"
function qapp() {
  osascript -e "with timeout of 15 seconds
    quit app \"$1\"
  end timeout" 2>/dev/null && echo "✓ Quit: $1" || echo "✗ Could not quit: $1 (not running or failed)"
}

# Quit all visible apps except a safe list
function quitall() {
  local keep=("Finder" "Terminal" "iTerm2" "iTerm" "Notes" "Visual Studio Code" "Perplexity" "Comet" "1Password" "Proton Mail" "NordVPN" "pCloud Drive")
  local running
  running=$(osascript -e 'tell application "System Events" to get the name of every process whose background only is false' | tr ',' '\n' | sed 's/^ //')
  while IFS= read -r app; do
    if [[ ! " ${keep[*]} " =~ " ${app} " ]]; then
      osascript -e "with timeout of 10 seconds
        quit app \"$app\"
      end timeout" 2>/dev/null && echo "✓ Quit: $app" || echo "⚠ Skipped: $app"
    else
      echo "→ Kept:  $app"
    fi
  done <<< "$running"
}

# Hide all visible apps except Terminal and iTerm2
alias hideall="osascript -e 'tell application \"System Events\" to set the visible of every process whose (background only is false and name is not \"Terminal\" and name is not \"iTerm2\") to false' && echo '✓ All apps hidden (Terminal kept)'"

# Show all hidden apps
alias showall="osascript -e 'tell application \"System Events\" to set the visible of every process to true' && echo '✓ All apps visible'"

# Bring a specific app to front: fapp "Safari"
function fapp() {
  osascript -e "tell application \"$1\" to activate" 2>/dev/null && echo "✓ Focused: $1" || echo "✗ Could not focus: $1"
}


# ==========================
# Apps & system
# ==========================

# System settings & Finder
alias sys='open -b com.apple.SystemPreferences'
alias f='open -a Finder'
alias fcd='open .'
alias emptytrash='rm -rf ~/.Trash/*'
alias lockmac='open /System/Library/CoreServices/Menu\ Extras/VolumeMixer.app'

# IDEs / tools
alias rstudio='open -a RStudio'

# Productivity & communication
alias proton='open -a ProtonMail'
alias comet='open -a Comet'
alias gmail='open -a Comet https://gmail.com'
alias perp='open -a Perplexity'
alias nord='open -a NordVPN'
alias 1pass='open -a 1Password'

# Cloud storage
alias pcloud='open ~/pCloud\ Drive'
alias icloud='open ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# Media & notes
alias podcasts='open -a Podcasts'
alias music='open -a Music'
alias notes='open -a Notes'

# ==========================
# Browser shortcuts
# ==========================

alias youtube='open -a Comet https://youtube.com'
alias google='open -a Comet https://google.com'
alias github='open -a Comet https://github.com/ETA444'

# ==========================
# Python & environments
# ==========================

alias python='python3'
alias pip='pip3'

# Playgrounds
alias playpython='cd ~/dev/dreemdev/projects/python/playground && source venv/bin/activate'
alias playr='cd ~/dev/dreemdev/projects/r/playground && R'

# ==========================
# Git QoL
# ==========================

# Status & diffs
alias gst='git status -sb'         # short status
alias gss='git status'             # full status
alias gd='git diff'
alias gds='git diff --stat'

# Commits & logs
alias gc='git commit'
alias gca='git commit -am'
alias gcm='git commit -m'
alias glog='git log --oneline --graph --decorate --all'

# Branching
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'

# Stash
alias gstash='git stash'
alias gstashp='git stash push'
alias gstashl='git stash list'
alias gstashpopp='git stash pop'

# Pull / push
alias gpl='git pull'
alias gps='git push'
alias gpsu='git push -u origin HEAD'

# Remote shortcuts
alias gremote='git remote -v'
