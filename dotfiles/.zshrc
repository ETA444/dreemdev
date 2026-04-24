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
# dreemdev help
# ==========================

function zhelp() {
  echo ""
  echo "\033[1;36m╔══════════════════════════════════════════════════════╗\033[0m"
  echo "\033[1;36m║              dreemdev  ·  shell manual               ║\033[0m"
  echo "\033[1;36m╚══════════════════════════════════════════════════════╝\033[0m"
  echo ""

  echo "\033[1;33m  CORE HELPERS\033[0m"
  echo "  \033[1mzhelp\033[0m          Print .zshrc shell manual"
  echo "  \033[1mzconfig\033[0m          Edit .zshrc and reload"
  echo "  \033[1mzcommit\033[0m          Quick commit .zshrc to dreemdev"
  echo "  \033[1mzlink\033[0m            Show ~/.zshrc symlink target"
  echo "  \033[1mhome\033[0m             cd ~ and list"
  echo "  \033[1mdesktop\033[0m          cd ~/Desktop and list"
  echo "  \033[1mdownloads\033[0m        cd ~/Downloads and list"
  echo "  \033[1mdev\033[0m              cd ~/dev and list"
  echo "  \033[1mbuild\033[0m            cd ~/dev/projects and list"
  echo "  \033[1mlearn\033[0m            cd ~/dev/learning and list"
  echo "  \033[1mdreemdev\033[0m         cd ~/dev/dreemdev and list"
  echo ""

  echo "\033[1;33m  SHELL QoL\033[0m"
  echo "  \033[1mll\033[0m               ls -lah (detailed list)"
  echo "  \033[1mla\033[0m               ls -A (show hidden files)"
  echo "  \033[1ml\033[0m                ls -lh (compact list)"
  echo "  \033[1m..\033[0m               cd .. and list"
  echo "  \033[1m...\033[0m              cd ../.. and list"
  echo "  \033[1m....\033[0m             cd ../../.. and list"
  echo "  \033[1mc\033[0m                clear terminal"
  echo "  \033[1mtree\033[0m             ASCII directory tree (no install needed)"
  echo ""

  echo "\033[1;33m  APP CONTROL  \033[0;2m(osascript)\033[0m"
  echo "  \033[1mapps\033[0m             List all visible running apps"
  echo "  \033[1mqapp\033[0m \033[3m\"App\"\033[0m        Quit a specific app by name"
  echo "  \033[1mquitall\033[0m          Quit all apps except the keep list"
  echo "  \033[1mhideall\033[0m          Hide all app windows (Terminal kept)"
  echo "  \033[1mshowall\033[0m          Unhide all apps"
  echo "  \033[1mfapp\033[0m \033[3m\"App\"\033[0m        Bring a specific app to front"
  echo ""

  echo "\033[1;33m  APPS & SYSTEM\033[0m"
  echo "  \033[1msys\033[0m              Open System Settings"
  echo "  \033[1mf\033[0m                Open Finder"
  echo "  \033[1mfcd\033[0m              Open Finder in current directory"
  echo "  \033[1memptytrash\033[0m       Empty the Trash"
  echo "  \033[1mlockmac\033[0m          Lock the screen"
  echo "  \033[1mrstudio\033[0m          Open RStudio"
  echo "  \033[1mproton\033[0m           Open Proton Mail"
  echo "  \033[1mcomet\033[0m            Open Comet browser"
  echo "  \033[1mgmail\033[0m            Open Gmail in Comet"
  echo "  \033[1mperp\033[0m             Open Perplexity"
  echo "  \033[1mnord\033[0m             Open NordVPN"
  echo "  \033[1m1pass\033[0m            Open 1Password"
  echo "  \033[1mpcloud\033[0m           Open pCloud Drive"
  echo "  \033[1micloud\033[0m           Open iCloud Drive"
  echo "  \033[1mpodcasts\033[0m         Open Podcasts"
  echo "  \033[1mmusic\033[0m            Open Music"
  echo "  \033[1mnotes\033[0m            Open Notes"
  echo ""

  echo "\033[1;33m  BROWSER SHORTCUTS\033[0m"
  echo "  \033[1myoutube\033[0m          Open YouTube in Comet"
  echo "  \033[1mgoogle\033[0m           Open Google in Comet"
  echo "  \033[1mgithub\033[0m           Open your GitHub profile in Comet"
  echo ""

  echo "\033[1;33m  PYTHON & ENVIRONMENTS\033[0m"
  echo "  \033[1mpython\033[0m           Alias for python3"
  echo "  \033[1mpip\033[0m              Alias for pip3"
  echo "  \033[1mplaypython\033[0m       cd Python playground and activate venv"
  echo "  \033[1mplayr\033[0m            cd R playground and open R"
  echo ""

  echo "\033[1;33m  GIT QoL\033[0m"
  echo "  \033[1mgst\033[0m              git status -sb · short, clean status"
  echo "  \033[1mgss\033[0m              git status · full status"
  echo "  \033[1mgd\033[0m               git diff · unstaged changes"
  echo "  \033[1mgds\033[0m              git diff --stat · diff summary"
  echo "  \033[1mgdc\033[0m              git diff --cached · staged changes"
  echo ""
  echo "  \033[1mgc\033[0m               git commit · open editor"
  echo "  \033[1mgca\033[0m              git commit -am · stage all + commit"
  echo "  \033[1mgcm\033[0m \033[3m\"msg\"\033[0m        git commit -m · inline message"
  echo "  \033[1mglog\033[0m             git log · visual graph, all branches"
  echo "  \033[1mglast\033[0m            git show HEAD · last commit details"
  echo "  \033[1mgwho\033[0m             git shortlog · commit count per author"
  echo ""
  echo "  \033[1mgcr\033[0m              git reset HEAD~1 · undo last commit, unstage"
  echo "  \033[1mgcrs\033[0m             git reset --soft HEAD~1 · undo, keep staged"
  echo "  \033[1mgfu\033[0m \033[3m<file>\033[0m       git restore --staged · unstage a file"
  echo "  \033[1mgnuke\033[0m            git reset --hard HEAD · discard ALL changes ⚠"
  echo ""
  echo "  \033[1mgco\033[0m \033[3mbranch\033[0m       git checkout · switch branch"
  echo "  \033[1mgcb\033[0m \033[3mbranch\033[0m       git checkout -b · new branch"
  echo "  \033[1mgb\033[0m               git branch · list local branches"
  echo "  \033[1mgba\033[0m              git branch -a · all branches"
  echo "  \033[1mgbdel\033[0m \033[3mbranch\033[0m     git branch -d · delete branch (safe)"
  echo ""
  echo "  \033[1mgstash\033[0m           git stash · stash changes"
  echo "  \033[1mgstashp\033[0m          git stash push · stash with message"
  echo "  \033[1mgstashl\033[0m          git stash list · list stashes"
  echo "  \033[1mgstashpopp\033[0m       git stash pop · apply latest stash"
  echo ""
  echo "  \033[1mgpl\033[0m              git pull"
  echo "  \033[1mgps\033[0m              git push"
  echo "  \033[1mgpsu\033[0m             git push -u origin HEAD · first push"
  echo "  \033[1mgpf\033[0m              git push --force-with-lease · safe force push"
  echo ""
  echo "  \033[1mgremote\033[0m          git remote -v · show remote URLs"
  echo "  \033[1mgfetch\033[0m           git fetch --all --prune · fetch + clean up"
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
