# VS Code Setup Scripts

This folder contains scripts that define my **standard VS Code setup** for Python, data science, machine learning/AI, web dev, and DevOps. It is meant to help me quickly bootstrap a new Mac or dev machine.

## Overview of Scripts

- `setup-vscode-extensions.sh`: Installs (and optionally updates) my curated VS Code extension stack. The extensions script passes --force through to code --install-extension when you call it with --force, so it doubles as a periodic “update all my core extensions” command.
- `setup-vscode-config-symlinks.sh`: Symlinks `settings.json` and `keybindings.json` from this repo into VS Code’s local user config folder. The script targets the standard macOS paths: `~/Library/Application Support/Code/User/settings.json` & `~/Library/Application Support/Code/User/keybindings.json`

Run from terminal (after the `code` CLI is available):

```bash
chmod +x setup-vscode-extensions.sh
chmod +x setup-vscode-config-symlinks.sh

# Fresh install / ensure everything in the list is present
./setup-vscode-extensions.sh

# Install + update everything in the list to latest versions
./setup-vscode-extensions.sh --force

# Symlink settings.json and keybindings.json into VS Code
./setup-vscode-config-symlinks.sh
```

---

## Overview of Configuration Files (`settings.json` & `keybindings.json`)

This folder also holds my core VS Code configuration files, which are symlinked to the actual system path by `setup-vscode-config-symlinks.sh`.

### `settings.json` highlights
- **Editor Basics**: Menlo/Monaco font, rulers at 80/120, formatting on save/paste.
- **Python / Data Science**: Configured to use Ruff as the default formatter and linter (disabling pylint/flake8 to avoid noise), with environment auto-activation.
- **Jupyter**: Optimizations for notebook interactive windows and workspace root handling.
- **Excludes**: Cleaned up search and file explorer trees (ignoring `__pycache__`, `.venv`, `.ipynb_checkpoints`, etc.).

### `keybindings.json` highlights

- `cmd+shift+j`: Execute Jupyter cell and select below (matches data science workflows). 
- `cmd+l`: Select from cursor to end of line.
- `cmd+k cmd+0` / `cmd+k cmd+j`: Fold/unfold all code blocks.
- `ctrl+``: Toggle integrated terminal.
- `cmd+shift+y`: Toggle output panel.


---
## `setup-vscode-extensions.sh` in detail

### 1. Python & Data Science

Installed by the script:

```bash
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.jupyter
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.datawrangler
code --install-extension ms-toolsai.python-ds-extension-pack
```

Notes:

- `ms-python.python` and `ms-python.vscode-pylance` are the core Python + language server stack.  
- `ms-python.jupyter` and `ms-toolsai.jupyter` give first‑class Jupyter notebook support. [web:127]  
- `ms-toolsai.datawrangler` adds a visual data grid and transformations, similar to GUI data tools. [web:125]  
- `ms-toolsai.python-ds-extension-pack` is Microsoft’s curated pack for Python data science work in VS Code. [web:125]

---

### 2. Code Quality, Typing & Tasks

```bash
code --install-extension charliermarsh.ruff
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.flake8
code --install-extension ms-vscode.makefile-tools
```

Notes:

- `ruff` is the modern, fast linter that can replace/aggregate many older tools. [web:106]  
- `black-formatter`, `isort`, and `flake8` cover formatting, imports, and extra linting. [web:108]  
- `makefile-tools` helps with running Make-based workflows (CI, data pipelines, etc.). [web:115]

---

### 3. Git & Version Control

```bash
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension donjayamanne.githistory
code --install-extension github.vscode-pull-request-github
```

Notes:

- `GitLens` is the main Git “superpower” extension (blame, history, insights). [web:102]  
- `git-graph` gives me a visual commit graph.  
- `githistory` provides per-file history and diff views.  
- `vscode-pull-request-github` integrates GitHub PRs and reviews directly into VS Code. [web:101]

---

### 4. Remote, Containers & Infra

```bash
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-azuretools.vscode-docker
code --install-extension hashicorp.terraform
code --install-extension iterative.dvc
```

Notes:

- `remote-ssh` lets me work on remote machines as if they were local. [web:110]  
- `remote-containers` enables Dev Containers, great for reproducible data/ML environments. [web:110]  
- `vscode-docker` brings Docker management into the IDE.  
- `hashicorp.terraform` supports infrastructure-as-code.  
- `iterative.dvc` integrates DVC into VS Code for data/experiment versioning. [web:106]

---

### 5. Productivity & Files

```bash
code --install-extension tamasfe.even-better-toml
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode.todo-tree
code --install-extension esbenp.prettier-vscode
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension sleistner.vscode-fileutils
code --install-extension usernamehw.errorlens
code --install-extension ms-vscode.live-server
```

Notes:

- `even-better-toml` and `vscode-yaml` cover common config formats (pyproject, CI, K8s, etc.). [web:102]  
- `todo-tree` surfaces TODO/FIXME across the codebase.  
- `Prettier` formats JS/TS/HTML/CSS and complements Black for Python. [web:133]  
- `code-spell-checker` catches typos in code and docs. [web:101]  
- `fileutils` speeds up creating/moving/renaming files.  
- `errorlens` brings diagnostics inline, closer to JetBrains IDE behavior. [web:106]  
- `live-server` is handy for quick web previews during dev.

---

### 6. AI / Code Intelligence

```bash
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat
code --install-extension Continue.continue
code --install-extension TabNine.tabnine-vscode
```

Notes:

- `GitHub.copilot` + `GitHub.copilot-chat` serve as the main pair programmer and in‑editor chat. [web:128][web:134]  
- `Continue` is an open, model‑agnostic assistant that can connect to different LLMs. [web:113][web:131]  
- `Tabnine` is a privacy‑focused completion engine. [web:102][web:134]

---

### 7. Web / JS / TS / Solidity

```bash
code --install-extension dbaeumer.vscode-eslint
code --install-extension meganrogge.template-string-converter
code --install-extension JuanBlanco.solidity
```

Notes:

- `ESLint` is the standard JS/TS linter. [web:102]  
- `template-string-converter` makes working with JS template strings nicer.  
- `solidity` adds syntax highlighting, linting, and tooling for smart contracts.

---

### 8. Themes & Appearance

```bash
code --install-extension dracula-theme.theme-dracula
code --install-extension pkief.material-icon-theme
code --install-extension zhuangtongfa.Material-theme
code --install-extension enkia.tokyo-night
```
