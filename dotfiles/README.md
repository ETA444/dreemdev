# Files

- `.zshrc` – loaded via a symlink from `~/.zshrc` on each machine.

---

## Oh My Zsh

This setup uses [Oh My Zsh](https://ohmyz.sh) as the framework for themes and plugins.

Key settings in `.zshrc`:

```zsh
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
```

- If `~/.oh-my-zsh` is missing, this block is skipped (no startup errors).
- After the bootstrap script installs Oh My Zsh + plugins, the theme and plugins activate automatically.

---

## Aliases and QoL

Highlights:

- Navigation:
  - `dev`, `build`, `learn`, `dreemdev` → jump into key folders under `~/dev`.
- Shell QoL:
  - `ll`, `la`, `l` → nicer `ls` variants.
  - `..`, `...`, `....` → quick up‑directory.
  - `tree` → tree‑like directory view using `find` + `sed` (no `tree` binary needed).
  - `c` → clear terminal.
- Apps:
  - `rstudio`, `perp`, `comet`, `pcloud`, `icloud`, `music`, `notes`, etc.
- Python/R:
  - `playpython` → activate Python playground venv.
  - `playr` → open R playground.
- Git:
  - `gst`, `gss` → `git status` variants.
  - `gd`, `gds` → diffs.
  - `gco`, `gcb`, `gb`, `gba` → branches.
  - `gpl`, `gps`, `gpsu` → pull/push helpers.
  - `gstash…` aliases → stash helpers.

---
