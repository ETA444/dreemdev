# dreemdev

***The most tedious parts of bootstrapping your dev needs. Automated, versioned & simplified.***

> 📖 **Looking for a specific manual?**
> - Dotfiles Manual → [`dotfiles/README.md`](dotfiles/README.md)
> - Mac Setup Manual → [`tools/configs/terminal/setup/setup-basics-manual.md`](tools/configs/terminal/setup/setup-basics-manual.md)
> - VSCode Setup Manual → [`tools/configs/vscode/README.md`](tools/configs/vscode/README.md)
>
> 🤖 **Looking for an automated setup script?**
> - Mac Setup Script → [`tools/configs/terminal/setup/setup-basics.sh`](tools/configs/terminal/setup/setup-basics.sh)
> - VSCode Extensions Setup script → [`tools/configs/vscode/setup-vscode-extensions.sh`](tools/configs/vscode/setup-vscode-extensions.sh)
> - VSCode Symlinks Setup script → [`tools/configs/vscode/setup-vscode-symlinks.sh`](tools/configs/vscode/setup-vscode-symlinks.sh)


---

## Quick Start (New Mac)

Clone the repo and run the interactive setup script:

```bash
git clone git@github.com:ETA444/dreemdev.git ~/dev/dreemdev
cd ~/dev/dreemdev/tools/configs/terminal/setup
bash setup-basics.sh
```

The script handles: Xcode CLT, Homebrew, Python, R, Oh My Zsh + plugins, Git identity,
SSH key generation, `~/dev` folder structure, and Python/R playground environments.

Symlink the shell config after setup:

```bash
ln -sf ~/dev/dreemdev/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

---

## Repository Structure

```text
dreemdev/
├─ README.md                        # This file
├─ dotfiles/
│  ├─ .zshrc                        # Main zsh config (Oh My Zsh, plugins, aliases)
│  └─ README.md                     # Full alias & config manual ← detailed docs here
├─ tools/
│  ├─ configs/
│  │  ├─ terminal/
│  │  │  └─ setup/
│  │  │     └─ setup-basics.sh      # Interactive new-Mac setup script
│  │  └─ vscode/                    # VSCode settings and keybindings
│  ├─ scripts/
│  │  └─ mail-filters/              # Gmail / Proton filter exports
│  └─ templates/
│     └─ vscode/                    # Starter VSCode workspace templates
└─ projects/
   ├─ python/
   │  └─ playground/                # Python scratch env (venv pre-configured)
   └─ r/
      ├─ dreemstat/                  # R statistics project
      └─ playground/                # R scratch env
```

---

## Dotfiles

The `.zshrc` lives here and is symlinked to `~/.zshrc`. All edits happen in this repo —
never edit `~/.zshrc` directly.

```bash
# Edit and reload in one step
zconfig

# Verify the symlink is correct
zlink

# Commit the latest .zshrc to the repo
zcommit
```

📖 Full alias reference and shell manual → [`dotfiles/README.md`](dotfiles/README.md)

---

## Tools

### Setup Script

The fastest path to a working Mac. Run it once, follow the prompts.

```bash
bash ~/dev/dreemdev/tools/configs/terminal/setup/setup-basics.sh
```

**What it sets up (interactive — each step is opt-in):**
- Xcode Command Line Tools
- Homebrew
- Python 3 (via Homebrew)
- R (via Homebrew)
- Oh My Zsh + `zsh-autosuggestions` + `zsh-syntax-highlighting`
- `.zshrc` symlink
- Git global config + SSH key generation
- `~/dev/` folder structure
- Python and R playground environments

### VSCode Configs

Settings and keybindings under `tools/configs/vscode/`. Copy manually or symlink:

```bash
# macOS VSCode settings path
ln -sf ~/dev/dreemdev/tools/configs/vscode/settings.json \
  ~/Library/Application\ Support/Code/User/settings.json
```

You can **automatically symlink** `settings.json`, `keybindings.json` and your snippets using `setup-vscode-symlinks.sh`, like so:

```bash
bash ~/dev/dreemdev/tools/configs/vscode/setup-vscode-symlinks.sh
```

You can also **automatically install and update extensions** using `setup-vscode-extensions.sh`, like so:

```bash
bash ~/dev/dreemdev/tools/configs/vscode/setup-vscode-extensions.sh
```

📖 Full VSCode setup scripts manual → [`tools/configs/vscode/README.md`](tools/configs/vscode/README.md)


### Scripts

Utility scripts under `tools/scripts/`.

#### Sieve Email Filters
Filters you can plug-and-play for your email system, currently they are designed to work in ProtonMail without need of any changes.

##### Admininstrative Emails:
- **2FA Filter:** universal filter to put all of your 2FA-like emails into a 2FA folder.
- **Web/Bank/Gov:** mix of specific and non-specific filters for your banking, government and web-admin emails.

##### Informative Emails:
- **Newsletters:** mix of specific and non-specific filters for your newsletters categorized by information type (e.g. science, spirituality, programming, etc.)

##### Shopping & Bills:
- **Invoices & Tickets:** universal filters for invoices, bills, tickets, etc.
- **Promotions:** mix of specific and non-specific filters for promotional emails categorized by product category (e.g. fashion, books, tech, general, etc.)

---

## Projects

Self-contained environments for experimentation and learning. Each playground has its
own virtual environment — nothing leaks into the global Python install.

### Python Playground

```bash
# Jump in (alias from .zshrc)
playpython

# Or manually
cd ~/dev/dreemdev/projects/python/playground
source venv/bin/activate
jupyter notebook
```

### R Playground

```bash
# Jump in (alias from .zshrc)
playr

# Or manually
cd ~/dev/dreemdev/projects/r/playground
R
```

### dreemstat

An R project for statistical work. Open in RStudio:

```bash
open ~/dev/dreemdev/projects/r/dreemstat/dreemstat.Rproj
```

---

## Keeping Things Updated

```bash
# Pull latest from remote
cd ~/dev/dreemdev && gpl

# After editing .zshrc
zcommit

# After editing anything else
gca "describe what changed"
gps
```

---

## Related Repositories

| Repo | Description | Visibility |
|------|-------------|------------|
| [`datasafari`](https://github.com/ETA444/datasafari) | Python library for automated DS/ML workflows | Public |
| `dreemgents` | AI agent configs, prompts, and related materials | Private |

---
