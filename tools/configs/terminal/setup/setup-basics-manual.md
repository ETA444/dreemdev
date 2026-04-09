# Setup Basics – New Mac Dev Bootstrap

This manual explains how the `setup-basics.sh` script works and gives copy–paste commands to perform each step manually if you ever need a fallback.

The high‑level flow:

1. Create your `~/dev` folder structure.  
2. Install Xcode Command Line Tools and Homebrew.  
3. Install Python and R (via Homebrew).  
4. Configure Git (name, email, editor).  
5. Generate an SSH key and connect it to GitHub.  
6. Install Oh My Zsh + plugins (autosuggestions, syntax highlighting).  
7. Clone the `dreemdev` repo via SSH.  
8. Deploy your `~/.zshrc` from `dreemdev/dotfiles/.zshrc`.  
9. Optionally bootstrap the Python and R playgrounds.  
10. Optionally clone additional repos into `projects`, `learning`, or `dreemdev`.

***

## 0. Running the script (recommended path)

### 0.1 Download and run `setup-basics.sh`

On a brand‑new Mac:

1. Log into GitHub in your browser and open the `dreemdev` repo.  
2. Navigate to `setup-basics.sh`, click **Raw**, copy everything, and save it as `~/setup-basics.sh`.  
3. In Terminal:

```bash
cd ~
chmod +x setup-basics.sh
./setup-basics.sh
```

4. Answer the prompts step by step. You can say “no” to any step you don’t want to run yet.

The rest of this document explains what each step does and shows how to do it manually.

***

## 1. Dev folder structure

### What the script does

- Creates the base layout under `~/dev`:

  - `~/dev/projects` – project repos (apps, libraries, services).  
  - `~/dev/learning` – learning repos, experiments, courses.  
  - `~/dev/dreemdev` – “motherload” repo (scripts, docs, configs, playgrounds).  
  - `~/dev/temp` – scratch area.  
  - `~/dev/archive` – old/parked work.

### Manual commands

```bash
cd ~
mkdir -p dev

mkdir -p dev/projects
mkdir -p dev/learning
mkdir -p dev/dreemdev
mkdir -p dev/temp
mkdir -p dev/archive
```

You can add subfolders later as you create or clone specific repos.

***

## 2. Xcode Command Line Tools and Homebrew

### What the script does

- Ensures Xcode Command Line Tools (CLT) are installed (they provide `git`, compilers, headers, etc.). [docs.brew](https://docs.brew.sh/Homebrew-and-Python)
- Ensures Homebrew is installed and on your PATH, so you can install Python, R, and other tools with `brew`. [docs.brew](https://docs.brew.sh/Homebrew-and-Python)

### Manual commands

#### 2.1 Install Xcode CLT

```bash
xcode-select --install
```

A macOS dialog will appear; accept and wait for installation to finish.

Check:

```bash
xcode-select -p
```

#### 2.2 Install Homebrew

Check if Homebrew exists:

```bash
brew --version
```

If you see a version, you’re done. Otherwise:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then add Homebrew to your shell environment (Apple Silicon default):

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Verify:

```bash
brew --version
```

***

## 3. Install Python and R via Homebrew

### What the script does

- Installs or upgrades:

  - `python` – Homebrew’s Python 3.x.  
  - `r` – base R (CLI) for data science/analytics. [formulae.brew](https://formulae.brew.sh/formula/r)

### Manual commands

```bash
# Python 3
brew install python      # or: brew upgrade python

# R
brew install r           # or: brew upgrade r
```

Check versions:

```bash
python3 --version
R --version
```

***

## 4. Git basic configuration

### What the script does

- Confirms `git` is available (via Xcode CLT).  
- Sets global Git identity and default editor.

### Manual commands

Check git:

```bash
git --version
```

Then configure:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global core.editor "nano"
```

Verify:

```bash
git config --global --get user.name
git config --global --get user.email
git config --global --get core.editor
```

***

## 5. SSH key and GitHub integration

### What the script does

- Ensures `~/.ssh` exists and has correct permissions.  
- Generates an Ed25519 SSH key if you don’t already have one.  
- Adds the key to `ssh-agent`.  
- Copies the public key to your clipboard and prints it.  
- Pauses so you can add it to your GitHub account.  
- Tests `ssh -T git@github.com`.

Using SSH for GitHub access is standard practice for dev workflows. [atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

### Manual commands

#### 5.1 Generate an Ed25519 key

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh

ssh-keygen -t ed25519 -C "you@example.com"
```

- Accept default path (`~/.ssh/id_ed25519`) unless you want a custom name.  
- Choose a strong passphrase if you want extra security.

#### 5.2 Add key to `ssh-agent`

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add -l
```

#### 5.3 Add key to GitHub

```bash
pbcopy < ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub
```

Then in GitHub:

1. Go to https://github.com  
2. Avatar → **Settings** → **SSH and GPG keys**  
3. **New SSH key** → name it (e.g. `MacBook Pro 2026`), paste the key, save.

Test:

```bash
ssh -T git@github.com
```

Type `yes` when asked to trust GitHub’s fingerprint. You should see a welcome message.

***

## 6. Oh My Zsh and plugins (autosuggestions, syntax highlighting)

### What the script does

- Installs **Oh My Zsh** if `~/.oh-my-zsh` does not exist, using the official unattended installer. [ohmyz](https://ohmyz.sh)
- Installs the plugins:
  - `zsh-autosuggestions` – shows ghosted command suggestions based on history. [git.gc4](https://git.gc4.at/linux/zsh-autosuggestions/src/commit/f1c3b98774bb52667fe3303ace477898aedd3b9b/INSTALL.md)
  - `zsh-syntax-highlighting` – colors commands/flags/paths as you type. [piyazon](https://piyazon.top/posts/ohmyzsh-zsh-syntax-highlighting-and-auto-suggestions/)
- Your `.zshrc` (from `dreemdev/dotfiles`) is written so it only loads Oh My Zsh if `~/.oh-my-zsh` exists, so it stays safe on machines where this step is skipped.

### Manual commands

#### 6.1 Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

If the installer asks to overwrite `~/.zshrc`, choose **No**, since your real config is tracked in `dreemdev/dotfiles`. If it did overwrite, just re‑symlink from `dreemdev` as shown in section 8.

#### 6.2 Install plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### 6.3 Ensure `.zshrc` loads them safely

In your `~/dev/dreemdev/dotfiles/.zshrc`, the relevant block should look roughly like:

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

This way, on a new Mac:

- Before you run this step, `.zshrc` skips Oh My Zsh/ plugins (no errors).  
- After this step, the theme + plugins are active in new shells. [blog.openreplay](https://blog.openreplay.com/customizing-terminal-oh-my-zsh-themes-plugins/)

***

## 7. Clone `dreemdev`

### What the script does

- After SSH is working, clones `dreemdev` via SSH into `~/dev/dreemdev`.  
- Uses `git@github.com:ETA444/dreemdev.git` by default (you can override in the prompt).

### Manual commands

```bash
cd ~/dev/dreemdev
git clone git@github.com:ETA444/dreemdev.git .   # note the dot for current directory
```

(or omit the trailing `.` if you want Git to create a `dreemdev` subfolder and you’re in `~/dev` instead).

***

## 8. Deploy `.zshrc` from `dreemdev/dotfiles`

### What the script does

- Looks for `~/dev/dreemdev/dotfiles/.zshrc`.  
- Backs up any existing `~/.zshrc` to `~/.zshrc.backup.YYYYMMDD-HHMMSS` (if it’s a regular file, not a symlink).  
- Symlinks:

  ```text
  ~/.zshrc -> ~/dev/dreemdev/dotfiles/.zshrc
  ```  

- Optionally sources `~/.zshrc` in the current shell.

This matches common dotfiles patterns: track dotfiles in a repo, then symlink into `$HOME`. [dev](https://dev.to/crafts69guy/how-to-manage-your-dotfiles-like-a-pro-with-git-and-stow-3pg1)

### Manual commands

First, move your current `.zshrc` into the repo and commit it (once):

```bash
# one-time, when migrating into dreemdev
mv ~/.zshrc ~/dev/dreemdev/dotfiles/.zshrc
cd ~/dev/dreemdev
git add dotfiles/.zshrc
git commit -m "Add zshrc to dotfiles"
```

On any new machine:

```bash
cd ~
if [ -f .zshrc ] && [ ! -L .zshrc ]; then
  cp .zshrc ".zshrc.backup.$(date +%Y%m%d-%H%M%S)"
fi

ln -sf ~/dev/dreemdev/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

***

## 9. Python playground environment

### What the script does

If `~/dev/dreemdev/projects/python/playground` exists and contains `requirements.txt`, it:

1. Deletes any existing `venv` in that folder.  
2. Creates a new venv with Homebrew’s `python3`.  
3. Upgrades `pip`.  
4. Installs packages from `requirements.txt`.  

This gives you a clean Python playground tied to your current Python version.

### Manual commands

```bash
cd ~/dev/dreemdev/projects/python/playground

# Remove old venv if you want a fresh one
rm -rf venv

# Create venv with Homebrew python
python3 -m venv venv

# Activate, install requirements, then deactivate
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate
```

***

## 10. R playground environment

### What the script does

If `~/dev/dreemdev/projects/r/playground` exists, it:

- If `renv.lock` exists:
  - Runs `install.packages("renv")` and `renv::restore()` to recreate the locked environment. [docs.posit](https://docs.posit.co/ide/user/ide/guide/environments/r/renv.html)
- Else, if `requirements.R` exists:
  - Runs `renv::init()`, sources `requirements.R` to install packages, then `renv::snapshot()`.  

This gives you a project‑local package library for R, similar to a Python venv. [bioinformatics.ccr.cancer](https://bioinformatics.ccr.cancer.gov/docs/reproducible-r-on-biowulf/L3_PackageManagement/)

### Manual commands

```bash
cd ~/dev/dreemdev/projects/r/playground
R
```

Inside R:

- If `renv.lock` exists:

```r
install.packages("renv")
renv::restore()
q()
```

- If `requirements.R` exists but no `renv.lock` yet:

```r
install.packages("renv")
renv::init()
source("requirements.R")
renv::snapshot()
q()
```

***

## 11. Cloning additional repos (projects / learning / dreemdev)

### What the script does

The script lets you add repos one by one:

For each repo:

1. Ask **repo name** (e.g. `datasafari`, `georgedreemer.com`, `dreemcorp`).  
2. Ask where it belongs:
   - `~/dev/projects`  
   - `~/dev/learning`  
   - `~/dev/dreemdev`  
3. Creates the base folder if needed.  
4. Clones `git@github.com:YOUR_USERNAME/REPO.git` into that location.

This keeps your `projects` and `learning` trees dynamic—no hard‑coded repos in the script.

### Manual commands

For a project repo:

```bash
cd ~/dev/projects
git clone git@github.com:ETA444/datasafari.git
```

For a learning repo:

```bash
cd ~/dev/learning
git clone git@github.com:ETA444/some-learning-repo.git
```

If you ever want to park a repo, just move it to `~/dev/archive`:

```bash
mv ~/dev/projects/old-project ~/dev/archive/
```

***
