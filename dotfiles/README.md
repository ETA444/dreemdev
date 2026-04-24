# dotfiles

Shell configuration for my Macs, versioned in `dreemdev` and symlinked to their respective system location.

```bash
# example: .zshrc
ln -sf ~/dev/dreemdev/dotfiles/.zshrc ~/.zshrc
```

***

## .zshrc

### Oh My Zsh

Shell framework providing theming, plugin management, and completions. The block is wrapped in a directory check so the file is safe to source before Oh My Zsh is installed.

| Setting | Value |
|---|---|
| Theme | `steeef` |
| Plugins | `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting` |
| Guard | Only loads if `~/.oh-my-zsh` exists — no errors on a fresh machine |

***

## Aliases

### Core Helpers

| Alias | Command | Description |
|---|---|---|
| `zhelp` | *(function)* | Print the full shell manual |
| `zconfig` | `nano ~/dev/dreemdev/dotfiles/.zshrc && source ~/.zshrc` | Edit `.zshrc` and reload in one step |
| `zcommit` | `git add .zshrc && git commit -m 'Update .zshrc'` | Quick commit of `.zshrc` to dreemdev |
| `zlink` | `ls -l ~/.zshrc` | Show symlink target to verify it points to dreemdev |
| `home` | `cd ~ && ls` | Go home |
| `desktop` | `cd ~/Desktop && ls` | Jump to Desktop |
| `downloads` | `cd ~/Downloads && ls` | Jump to Downloads |
| `dev` | `cd ~/dev && ls` | Jump to dev root |
| `build` | `cd ~/dev/projects && ls` | Jump to projects folder |
| `learn` | `cd ~/dev/learning && ls` | Jump to learning folder |
| `dreemdev` | `cd ~/dev/dreemdev && ls` | Jump to dreemdev repo |

***

### Shell QoL

| Alias | Command | Description |
|---|---|---|
| `ll` | `ls -lah` | Detailed list with hidden files and human-readable sizes |
| `la` | `ls -A` | List including hidden files, compact |
| `l` | `ls -lh` | Compact list with human-readable sizes |
| `..` | `cd .. && ls` | Up one directory |
| `...` | `cd ../.. && ls` | Up two directories |
| `....` | `cd ../../.. && ls` | Up three directories |
| `c` | `clear` | Clear terminal output |
| `tree` | `find . -print \| sed …` | ASCII directory tree — no binary needed |

***

### App Control (osascript)

Uses AppleScript via `osascript` to control macOS apps from the terminal.

| Alias / Function | Description |
|---|---|
| `apps` | List all visible foreground apps currently running (sorted) |
| `qapp "AppName"` | Gracefully quit a specific app by name (15s timeout) |
| `quitall` | Quit all visible apps except the keep list (see below) |
| `hideall` | Hide all app windows instantly — Terminal and iTerm2 kept visible |
| `showall` | Unhide all apps and restore windows |
| `fapp "AppName"` | Bring a specific app to the foreground |

**`quitall` keep list** — these apps are never touched:

`Finder` · `Terminal` · `iTerm2` · `iTerm` · `Notes` · `Visual Studio Code` · `Perplexity` · `Comet` · `1Password` · `Proton Mail` · `NordVPN` · `pCloud Drive`

***

### Apps & System

| Alias | Description |
|---|---|
| `sys` | Open System Settings |
| `f` | Open Finder |
| `fcd` | Open Finder in the current directory |
| `emptytrash` | Empty the Trash |
| `lockmac` | Lock the screen |
| `rstudio` | Open RStudio |
| `proton` | Open Proton Mail |
| `comet` | Open Comet browser |
| `gmail` | Open Gmail in Comet |
| `perp` | Open Perplexity |
| `nord` | Open NordVPN |
| `1pass` | Open 1Password |
| `pcloud` | Open pCloud Drive |
| `icloud` | Open iCloud Drive |
| `podcasts` | Open Podcasts |
| `music` | Open Music |
| `notes` | Open Notes |

***

### Browser Shortcuts

| Alias | Description |
|---|---|
| `youtube` | Open YouTube in Comet |
| `google` | Open Google in Comet |
| `github` | Open ETA444 GitHub profile in Comet |

***

### Python & Environments

| Alias | Command | Description |
|---|---|---|
| `python` | `python3` | Default to Python 3 |
| `pip` | `pip3` | Default to pip3 |
| `playpython` | `cd …/playground && source venv/bin/activate` | Enter Python playground with venv active |
| `playr` | `cd …/playground && R` | Enter R playground |

***

### Git QoL

#### Status & Diffs

| Alias | Command | Description |
|---|---|---|
| `gst` | `git status -sb` | Short, clean status with branch info |
| `gss` | `git status` | Full status output |
| `gd` | `git diff` | Show unstaged changes |
| `gds` | `git diff --stat` | Diff summary — files changed and line counts |
| `gdc` | `git diff --cached` | Show staged changes before committing |

#### Commits & Logs

| Alias | Command | Description |
|---|---|---|
| `gc` | `git commit` | Open editor for commit message |
| `gca` | `git commit -am` | Stage all tracked files and commit |
| `gcm "msg"` | `git commit -m` | Commit with inline message |
| `glog` | `git log --oneline --graph --decorate --all` | Visual graph of all branches |
| `glast` | `git show --stat HEAD` | Show contents and stats of last commit |
| `gwho` | `git shortlog -sn --all` | Commit count per author |

#### Resetting & Restoring

| Alias | Command | Description |
|---|---|---|
| `gcr` | `git reset HEAD~1` | Undo last commit, keep changes unstaged |
| `gcrs` | `git reset --soft HEAD~1` | Undo last commit, keep changes staged |
| `gfu <file>` | `git restore --staged` | Unstage a specific file |
| `gnuke` | `git reset --hard HEAD` | ⚠ Discard ALL uncommitted changes permanently |

#### Branching

| Alias | Command | Description |
|---|---|---|
| `gco <branch>` | `git checkout` | Switch to a branch or restore a file |
| `gcb <branch>` | `git checkout -b` | Create and switch to a new branch |
| `gb` | `git branch` | List local branches |
| `gba` | `git branch -a` | List all branches including remotes |
| `gbdel <branch>` | `git branch -d` | Delete a branch (safe — won't delete unmerged) |

#### Stash

| Alias | Command | Description |
|---|---|---|
| `gstash` | `git stash` | Stash current changes |
| `gstashp` | `git stash push` | Stash with optional message |
| `gstashl` | `git stash list` | List all stashes |
| `gstashpopp` | `git stash pop` | Apply latest stash and remove it |

#### Pull / Push

| Alias | Command | Description |
|---|---|---|
| `gpl` | `git pull` | Pull current branch |
| `gps` | `git push` | Push current branch |
| `gpsu` | `git push -u origin HEAD` | Push and set upstream (first push of a branch) |
| `gpf` | `git push --force-with-lease` | Safe force push — aborts if remote has new commits |

#### Remote

| Alias | Command | Description |
|---|---|---|
| `gremote` | `git remote -v` | Show remote URLs |
| `gfetch` | `git fetch --all --prune` | Fetch all remotes and prune dead branches |

***

*Edit with `zconfig` · Commit with `zcommit` · View manual with `zhelp`*
