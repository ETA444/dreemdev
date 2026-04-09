ZSH_THEME="agnoster"

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
alias home='cd ~'
alias dev='cd ~/dev'
alias build='cd ~/dev/projects'
alias learn='cd ~/dev/learning'
alias dreemdev='cd ~/dev/dreemdev'

# ==========================
# Shell QoL
# ==========================

# Better ls
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -lh'

# Quick up-directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Clear terminal
alias c='clear'

# Tree-like view without installing tree:
# Shows a simple ASCII tree of the current directory
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# ==========================
# Apps & system
# ==========================

# System settings & Finder
alias sys='open -b com.apple.SystemPreferences'
alias f='open -a Finder'
alias fcd='open .'

# IDEs / tools
alias rstudio='open -a RStudio'

# Productivity & communication
alias proton='open -a ProtonMail'
alias comet='open -a Comet'
alias gmail='open -a \"Comet\" https://gmail.com'
alias perp='open -a Perplexity'
alias nord='open -a NordVPN'

# Cloud storage
alias pcloud='open \"/Users/eta444/pCloud Drive\"'
alias icloud='open \"/Users/eta444/Library/Mobile Documents/com~apple~CloudDocs\"'

# Media & notes
alias podcasts='open -a Podcasts'
alias music='open -a Music'
alias notes='open -a Notes'

# ==========================
# Browser shortcuts
# ==========================

alias youtube='open -a \"Comet\" https://youtube.com'
alias google='open -a \"Comet\" https://google.com'

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
