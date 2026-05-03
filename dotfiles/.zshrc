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

function zhelp() {
  echo ""
  echo "\033[1;36m╔══════════════════════════════════════════════════════╗\033[0m"
  echo "\033[1;36m║              dreemdev  ·  shell manual               ║\033[0m"
  echo "\033[1;36m╚══════════════════════════════════════════════════════╝\033[0m"
  echo ""
  echo "\033[1;33m  CORE HELPERS\033[0m"
  echo "  \033[1mzhelp\033[0m                 \033[0;32mPrint this shell manual\033[0m"
  echo "  \033[1mzconfig\033[0m               \033[0;32mEdit .zshrc and reload\033[0m"
  echo "  \033[1mzcommit\033[0m               \033[0;32mQuick commit .zshrc to dreemdev\033[0m"
  echo "  \033[1mzlink\033[0m                 \033[0;32mShow ~/.zshrc symlink target\033[0m"
  echo "  \033[1mhome\033[0m                  \033[0;32mcd ~ and list\033[0m"
  echo "  \033[1mdesktop\033[0m               \033[0;32mcd ~/Desktop and list\033[0m"
  echo "  \033[1mdownloads\033[0m             \033[0;32mcd ~/Downloads and list\033[0m"
  echo "  \033[1mdev\033[0m                   \033[0;32mcd ~/dev and list\033[0m"
  echo "  \033[1mbuild\033[0m                 \033[0;32mcd ~/dev/projects and list\033[0m"
  echo "  \033[1mlearn\033[0m                 \033[0;32mcd ~/dev/learning and list\033[0m"
  echo "  \033[1mdreemdev\033[0m              \033[0;32mcd ~/dev/dreemdev and list\033[0m"
  echo ""
  echo "\033[1;33m  SHELL QoL\033[0m"
  echo "  \033[1mll\033[0m                    ls -lah \033[0;33m·\033[0m \033[0;32mdetailed list with hidden files\033[0m"
  echo "  \033[1mla\033[0m                    ls -A \033[0;33m·\033[0m \033[0;32mlist including hidden files\033[0m"
  echo "  \033[1ml\033[0m                     ls -lh \033[0;33m·\033[0m \033[0;32mcompact list with sizes\033[0m"
  echo "  \033[1m..\033[0m                    cd .. \033[0;33m·\033[0m \033[0;32mup one directory\033[0m"
  echo "  \033[1m...\033[0m                   cd ../.. \033[0;33m·\033[0m \033[0;32mup two directories\033[0m"
  echo "  \033[1m....\033[0m                  cd ../../.. \033[0;33m·\033[0m \033[0;32mup three directories\033[0m"
  echo "  \033[1mc\033[0m                     clear \033[0;33m·\033[0m \033[0;32mclear terminal output\033[0m"
  echo "  \033[1mtree\033[0m \033[3m[depth]\033[0m          find … \033[0;33m·\033[0m \033[0;32mASCII tree, default depth 3, skips .venv, etc.\033[0m"
  echo ""
  echo "\033[1;33m  APP CONTROL  \033[2m(osascript)\033[0m"
  echo "  \033[1mapps\033[0m                  \033[0;32mList all visible running apps (sorted)\033[0m"
  echo "  \033[1mqapp\033[0m \033[3m\"App\"\033[0m            \033[0;32mQuit a specific app by name\033[0m"
  echo "  \033[1mquitall\033[0m               \033[0;32mQuit all apps except the keep list\033[0m"
  echo "  \033[1mhideall\033[0m               \033[0;32mHide all app windows (Terminal kept)\033[0m"
  echo "  \033[1mshowall\033[0m               \033[0;32mUnhide all apps\033[0m"
  echo "  \033[1mfapp\033[0m \033[3m\"App\"\033[0m            \033[0;32mBring a specific app to front\033[0m"
  echo ""
  echo "\033[1;33m  APPS & SYSTEM\033[0m"
  echo "  \033[1msys\033[0m                   \033[0;32mOpen System Settings\033[0m"
  echo "  \033[1mf\033[0m                     \033[0;32mOpen Finder\033[0m"
  echo "  \033[1mfcd\033[0m                   \033[0;32mOpen Finder in current directory\033[0m"
  echo "  \033[1memptytrash\033[0m            \033[0;32mEmpty the Trash\033[0m"
  echo "  \033[1mlockmac\033[0m               \033[0;32mLock the screen\033[0m"
  echo "  \033[1mrstudio\033[0m               \033[0;32mOpen RStudio\033[0m"
  echo "  \033[1mproton\033[0m                \033[0;32mOpen Proton Mail\033[0m"
  echo "  \033[1mcomet\033[0m                 \033[0;32mOpen Comet browser\033[0m"
  echo "  \033[1mgmail\033[0m                 \033[0;32mOpen Gmail in Comet\033[0m"
  echo "  \033[1mperp\033[0m                  \033[0;32mOpen Perplexity\033[0m"
  echo "  \033[1mnord\033[0m                  \033[0;32mOpen NordVPN\033[0m"
  echo "  \033[1m1pass\033[0m                 \033[0;32mOpen 1Password\033[0m"
  echo "  \033[1mpcloud\033[0m                \033[0;32mOpen pCloud Drive\033[0m"
  echo "  \033[1micloud\033[0m                \033[0;32mOpen iCloud Drive\033[0m"
  echo "  \033[1mpodcasts\033[0m              \033[0;32mOpen Podcasts\033[0m"
  echo "  \033[1mmusic\033[0m                 \033[0;32mOpen Music\033[0m"
  echo "  \033[1mnotes\033[0m                 \033[0;32mOpen Notes\033[0m"
  echo ""
  echo "\033[1;33m  BROWSER SHORTCUTS\033[0m"
  echo "  \033[1myoutube\033[0m               \033[0;32mOpen YouTube in Comet\033[0m"
  echo "  \033[1mgoogle\033[0m                \033[0;32mOpen Google in Comet\033[0m"
  echo "  \033[1mgithub\033[0m                \033[0;32mOpen your GitHub profile in Comet\033[0m"
  echo ""
  echo "\033[1;33m  PYTHON & ENVIRONMENTS\033[0m"
  echo "  \033[1mpython\033[0m                python3 \033[0;33m·\033[0m \033[0;32mdefault to Python 3\033[0m"
  echo "  \033[1mpip\033[0m                   pip3 \033[0;33m·\033[0m \033[0;32mdefault to pip3\033[0m"
  echo "  \033[1mplaypython\033[0m            source venv/bin/activate \033[0;33m·\033[0m \033[0;32menter Python playground venv\033[0m"
  echo "  \033[1mplayr\033[0m                 cd …/playground && R \033[0;33m·\033[0m \033[0;32menter R playground\033[0m"
  echo ""
  echo "\033[1;33m  NETWORK & DATA MONITOR\033[0m"
  echo "  \033[1mbw\033[0m                    \033[0;32mLive bandwidth by process (all interfaces)\033[0m"
  echo "  \033[1mbwt\033[0m                   \033[0;32mCumulative session totals (all interfaces)\033[0m"
  echo "  \033[1mbwwifi\033[0m                \033[0;32mCumulative totals, Wi-Fi only (en0)\033[0m"
  echo "  \033[1mbwn\033[0m                   \033[0;32mLive view, no DNS resolve (faster)\033[0m"
  echo "  \033[1mbwtn\033[0m                  \033[0;32mCumulative totals, no DNS (cleanest)\033[0m"
  echo "  \033[1mbwsession\033[0m             \033[0;32mTimestamped hotspot session tracker (auto-detects interface)\033[0m"
  echo "  \033[1micloudpause\033[0m           \033[0;32mPause iCloud sync daemon (before hotspot sessions)\033[0m"
  echo "  \033[1micloudresume\033[0m          \033[0;32mResume iCloud sync daemon (back on Wi-Fi)\033[0m"
  echo ""
  echo "\033[1;33m  GIT QoL\033[0m"
  echo "  \033[1mgst\033[0m                   git status -sb \033[0;33m·\033[0m \033[0;32mshort, clean status\033[0m"
  echo "  \033[1mgss\033[0m                   git status \033[0;33m·\033[0m \033[0;32mfull status\033[0m"
  echo "  \033[1mgd\033[0m                    git diff \033[0;33m·\033[0m \033[0;32munstaged changes\033[0m"
  echo "  \033[1mgds\033[0m                   git diff --stat \033[0;33m·\033[0m \033[0;32mdiff summary\033[0m"
  echo "  \033[1mgdc\033[0m                   git diff --cached \033[0;33m·\033[0m \033[0;32mstaged changes\033[0m"
  echo ""
  echo "  \033[1mgc\033[0m                    git commit \033[0;33m·\033[0m \033[0;32mopen editor\033[0m"
  echo "  \033[1mgca\033[0m                   git commit -am \033[0;33m·\033[0m \033[0;32mstage all + commit\033[0m"
  echo "  \033[1mgcm\033[0m \033[3m\"msg\"\033[0m             git commit -m \033[0;33m·\033[0m \033[0;32minline message\033[0m"
  echo "  \033[1mglog\033[0m                  git log \033[0;33m·\033[0m \033[0;32mvisual graph, all branches\033[0m"
  echo "  \033[1mglast\033[0m                 git show HEAD \033[0;33m·\033[0m \033[0;32mlast commit details\033[0m"
  echo "  \033[1mgwho\033[0m                  git shortlog \033[0;33m·\033[0m \033[0;32mcommit count per author\033[0m"
  echo ""
  echo "  \033[1mgcr\033[0m                   git reset HEAD~1 \033[0;33m·\033[0m \033[0;32mundo last commit, unstage\033[0m"
  echo "  \033[1mgcrs\033[0m                  git reset --soft HEAD~1 \033[0;33m·\033[0m \033[0;32mundo, keep staged\033[0m"
  echo "  \033[1mgfu\033[0m \033[3m<file>\033[0m            git restore --staged \033[0;33m·\033[0m \033[0;32munstage a file\033[0m"
  echo "  \033[1mgnuke\033[0m                 git reset --hard HEAD \033[0;33m·\033[0m \033[0;31mdiscard ALL changes ⚠\033[0m"
  echo ""
  echo "  \033[1mgco\033[0m \033[3mbranch\033[0m            git checkout \033[0;33m·\033[0m \033[0;32mswitch branch\033[0m"
  echo "  \033[1mgcb\033[0m \033[3mbranch\033[0m            git checkout -b \033[0;33m·\033[0m \033[0;32mnew branch\033[0m"
  echo "  \033[1mgb\033[0m                    git branch \033[0;33m·\033[0m \033[0;32mlist local branches\033[0m"
  echo "  \033[1mgba\033[0m                   git branch -a \033[0;33m·\033[0m \033[0;32mall branches\033[0m"
  echo "  \033[1mgbdel\033[0m \033[3mbranch\033[0m          git branch -d \033[0;33m·\033[0m \033[0;32mdelete branch (safe)\033[0m"
  echo ""
  echo "  \033[1mgstash\033[0m                git stash \033[0;33m·\033[0m \033[0;32mstash changes\033[0m"
  echo "  \033[1mgstashp\033[0m               git stash push \033[0;33m·\033[0m \033[0;32mstash with message\033[0m"
  echo "  \033[1mgstashl\033[0m               git stash list \033[0;33m·\033[0m \033[0;32mlist stashes\033[0m"
  echo "  \033[1mgstashpopp\033[0m            git stash pop \033[0;33m·\033[0m \033[0;32mapply latest stash\033[0m"
  echo ""
  echo "  \033[1mgpl\033[0m                   git pull"
  echo "  \033[1mgps\033[0m                   git push"
  echo "  \033[1mgpsu\033[0m                  git push -u origin HEAD \033[0;33m·\033[0m \033[0;32mfirst push of a branch\033[0m"
  echo "  \033[1mgpf\033[0m                   git push --force-with-lease \033[0;33m·\033[0m \033[0;32msafe force push\033[0m"
  echo ""
  echo "  \033[1mgremote\033[0m               git remote -v \033[0;33m·\033[0m \033[0;32mshow remote URLs\033[0m"
  echo "  \033[1mgfetch\033[0m                git fetch --all --prune \033[0;33m·\033[0m \033[0;32mfetch + clean up\033[0m"
  echo ""
  echo "\033[1;33m  cPanel Controls\033[0m"
  echo "  \033[1mcpanel\033[0m            \033[0;32mOpen cPanel Web Interface in browser\033[0m"
  echo "  \033[1mcpanel-ssh\033[0m            \033[0;32mSSH into premium85 cPanel server\033[0m"
  echo "  \033[1mcpanel-sync-cryptopandemic\033[0m  \033[0;32mSync cryptopandemic.com → local → ready to commit\033[0m"
  echo ""
  echo ""
  echo "\033[2m  Type 'zconfig' to edit · dreemdev/dotfiles/.zshrc\033[0m"
  echo ""
}

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

# =============================================================================
# tree — pretty-print directory structure with depth control
#
# USAGE:
#   tree          → current dir, default depth (3)
#   tree 2        → current dir, depth 2
#   tree 5        → current dir, depth 5
#
# EXAMPLES:
#   tree               # quick overview of any project
#   tree 1             # top-level only (great for ~/dev)
#   tree 2             # one level in, good for most repos
#   tree 4             # go deeper when you need it
#
# EXCLUDED (always hidden regardless of depth):
#   .git, node_modules, __pycache__, .venv, .mypy_cache, .pytest_cache
# =============================================================================
tree() {
  local depth=${1:-3}
  find . -maxdepth "$depth" \
    -not -path '*/.git/*' \
    -not -path '*/node_modules/*' \
    -not -path '*/__pycache__/*' \
    -not -path '*/.venv/*' \
    -not -path '*/.mypy_cache/*' \
    -not -path '*/.pytest_cache/*' \
    -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

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
  local keep=("Finder" "Terminal" "iTerm2" "iTerm" "AlDente" "Notes" "Visual Studio Code" "Perplexity" "Comet" "1Password" "Proton Mail" "NordVPN" "pCloud Drive")
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


# ========================================
# Network & data monitoring & management
# ========================================

# Live view — all interfaces, real-time bandwidth by process
alias bw='sudo bandwhich'

# Session totals — cumulative MB used since launch (all interfaces)
alias bwt='sudo bandwhich -t'

# Hotspot session — cumulative totals, Wi-Fi interface only (en0)
alias bwwifi='sudo bandwhich -t -i en0'

# Fast live view — skip DNS resolution (cleaner output, lower overhead)
alias bwn='sudo bandwhich -n'

# Fast totals — cumulative + no DNS (best for quick hotspot checks)
alias bwtn='sudo bandwhich -t -n'

# Pause iCloud sync (before hotspot sessions)
alias icloudpause='
  kill -SIGSTOP $(pgrep -x cloudd) 2>/dev/null
  kill -SIGSTOP $(pgrep -x nsurlsessiond) 2>/dev/null
  kill -SIGSTOP $(pgrep -x bird) 2>/dev/null
  echo "✓ iCloud sync paused (cloudd + nsurlsessiond + bird frozen)"
'

# Resume iCloud sync (back on Wi-Fi)
alias icloudresume='
  kill -SIGCONT $(pgrep -x cloudd) 2>/dev/null
  kill -SIGCONT $(pgrep -x nsurlsessiond) 2>/dev/null
  kill -SIGCONT $(pgrep -x bird) 2>/dev/null
  echo "✓ iCloud sync resumed"
'

# =============================================================================
# bwsession — timestamped hotspot session tracker
#
# USAGE:
#   bwsession        → auto-detects active interface, starts cumulative tracker
#
# NOTES:
#   - Falls back to en0 if interface can't be detected
#   - Run at the start of a hotspot session
#   - The cumulative column is your running MB total
# =============================================================================
function bwsession() {
  local iface
  iface=$(route get default 2>/dev/null | awk '/interface/ {print $2}')
  iface=${iface:-en0}
  echo ""
  echo "\\033[1;36m📡 bandwhich session\\033[0m  ·  interface: \\033[1m$iface\\033[0m  ·  started: \\033[1m$(date '+%H:%M:%S')\\033[0m"
  echo ""
  sudo bandwhich -t -i "$iface"
}

# ==========================
# Git QoL
# ==========================

# Status & diffs
alias gst='git status -sb'                          # Short, clean status
alias gss='git status'                              # Full status
alias gd='git diff'                                 # Unstaged changes
alias gds='git diff --stat'                         # Diff summary (files changed)
alias gdc='git diff --cached'                       # Staged changes (pre-commit review)

# Commits & logs
alias gc='git commit'                               # Open editor for commit
alias gca='git commit -am'                          # Stage all tracked + commit
alias gcm='git commit -m'                           # Commit with inline message
alias glog='git log --oneline --graph --decorate --all'  # Visual branch graph
alias glast='git show --stat HEAD'                  # Show last commit details
alias gwho='git shortlog -sn --all'                 # Commit count per author

# Resetting & restoring
alias gcr='git reset HEAD~1'                        # Undo last commit, unstage changes
alias gcrs='git reset --soft HEAD~1'               # Undo last commit, keep staged
alias gfu='git restore --staged'                    # Unstage a specific file: gfu <file>
alias gnuke='git reset --hard HEAD'                 # Discard ALL uncommitted changes (careful)

# Branching
alias gco='git checkout'                            # Switch branch or restore file
alias gcb='git checkout -b'                         # Create and switch to new branch
alias gb='git branch'                               # List local branches
alias gba='git branch -a'                           # List all branches (local + remote)
alias gbdel='git branch -d'                         # Delete branch (safe): gbdel <branch>

# Stash
alias gstash='git stash'                            # Stash current changes
alias gstashp='git stash push'                      # Stash with optional message
alias gstashl='git stash list'                      # List all stashes
alias gstashpopp='git stash pop'                    # Apply latest stash and remove it

# Pull / push
alias gpl='git pull'                                # Pull current branch
alias gps='git push'                                # Push current branch
alias gpsu='git push -u origin HEAD'                # Push and set upstream (first push)
alias gpf='git push --force-with-lease'             # Safe force push (won't overwrite others)

# Remote shortcuts
alias gremote='git remote -v'                       # Show remote URLs
alias gfetch='git fetch --all --prune'              # Fetch all remotes, prune dead branches

# ==========================
# cPanel
# ==========================

# Open cPanel Web Interface in browser
alias cpanel="open -a Comet https://premium85.web-hosting.com:2083/cpsess4367827383/frontend/jupiter/index.html"

# SSH into cPanel server
alias cpanel-ssh="ssh -p 21098 georznmu@premium85.web-hosting.com"

# Site syncs — pull from server to local, then commit manually
alias cpanel-sync-cryptopandemic="~/dev/projects/cryptopandemic.com/scripts/cpanel-sync.sh"
