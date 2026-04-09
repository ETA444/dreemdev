ZSH_THEME="agnoster"

# === ALIASES ===

# zshrc: quick config, reload & symlink check
alias config='nano ~/dev/dreemdev/dotfiles/.zshrc && source ~/.zshrc && ls -l ~/.zshrc'

# frequently used folders
alias home='cd ~'
alias dev='cd ~/dev'
alias build='cd ~/dev/projects'
alias learn='cd ~/dev/learning'
alias dreemdev='cd ~/dev/dreemdev'

# frequently used apps
alias sys='open -b com.apple.SystemPreferences'
alias f='open -a Finder'
alias fcd='open .'

alias rstudio='open -a RStudio'

alias proton='open -a ProtonMail'
alias gmail='open -a "Comet" https://gmail.com'

alias comet='open -a Comet'
alias perp='open -a Perplexity'

alias nord='open -a NordVPN'
alias pcloud='open "/Users/eta444/pCloud Drive"'
alias icloud='open "/Users/eta444/Library/Mobile Documents/com~apple~CloudDocs"'

alias podcasts='open -a Podcasts'
alias music='open -a Music'
alias notes='open -a Notes'

# frequently used sites
alias youtube='open -a "Comet" https://youtube.com'
alias google='open -a "Comet" https://google.com'

# python
alias python='python3'
alias pip='pip3'

# python environments
alias playpython='cd ~/dev/dreemdev/projects/python/playground && source venv/bin/activate'
alias playr='cd ~/dev/dreemdev/projects/r/playground && R'
