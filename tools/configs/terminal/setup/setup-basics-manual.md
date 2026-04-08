# Setup Basics 1

This is the manual, copy–paste friendly version of the interactive bash script.

## Quick recap

- Section 1: created `~/dev` structure and aliases.
- Section 2: installed Xcode CLT and Homebrew.
- Section 3: configured global Git identity and editor.
- Section 4: generated SSH key and connected it to GitHub.
- Section 5: cloned your key GitHub repos.

---

## 1. Create dev folder structure and aliases

### 1.1 Create dev folders

```bash
cd ~
mkdir -p dev

mkdir -p dev/projects/{datasafari,dreemcorp,georgedreemer.com}
mkdir -p dev/learning/{1month-learning,datacamp-learning}
mkdir -p dev/dreemdev
mkdir -p dev/temp
mkdir -p dev/archive
```

### 1.2 Add aliases to `~/.zshrc`

```bash
nano ~/.zshrc
```

Add these lines (or update them if they already exist):

```bash
alias dev='cd ~/dev'
alias build='cd ~/dev/projects'
alias learn='cd ~/dev/learning'
alias practice='cd ~/dev/dreemdev'
```

Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X` in nano), then either open a new Terminal window or run:

```bash
source ~/.zshrc
```

Now you can use `dev`, `build`, `learn`, and `practice` commands.

---

## 2. Install Xcode Command Line Tools and Homebrew

### 2.1 Xcode Command Line Tools

This may pop up a macOS dialog.

```bash
xcode-select --install
```

Wait for installation to finish.

### 2.2 Install Homebrew

Check if Homebrew is already installed:

```bash
brew --version
```

If you see a version, you can skip installation. Otherwise, install:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, verify:

```bash
brew --version
```

---

## 3. Git basic configuration

Check git is available:

```bash
git --version
```

If git is missing, make sure Xcode Command Line Tools are installed (section 2.1).

Set your global name, email, and editor (change the placeholders):

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

---

## 4. Generate SSH key and connect to GitHub

### 4.1 Generate an Ed25519 SSH key

If you already have an SSH key and want to reuse it, you can skip this and just verify it in 4.3.

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh

ssh-keygen -t ed25519 -C "you@example.com"
```

- When prompted for a file path, you can accept the default (`~/.ssh/id_ed25519`).
- When prompted for a passphrase, choose a strong passphrase (or leave empty if you really want, but passphrase is recommended).

### 4.2 Add key to ssh-agent

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add -l
```

### 4.3 Copy public key and add it to GitHub

Copy the public key to your clipboard and also print it:

```bash
cat ~/.ssh/id_ed25519.pub | pbcopy
cat ~/.ssh/id_ed25519.pub
```

Then in your browser:

1. Go to https://github.com.
2. Click your avatar (top right) → **Settings**.
3. Go to **SSH and GPG keys**.
4. Click **New SSH key**.
5. Give it a descriptive title (e.g., `MacBook Pro 2026`).
6. Paste the key from your clipboard, and save.

After saving, test the SSH connection:

```bash
ssh -T git@github.com
```

You may see a message like:

> The authenticity of host 'github.com (...)' can't be established.

Type `yes` and press Enter. If everything is good, you should see a greeting from GitHub.

---

## 5. Clone your repos

Decide where you want to clone your main repos. Two options you might like:

- `~/dev/dreemdev` for “active development” repos.
- `~/dev/projects` for a broader collection.

### 5.1 Example: clone into `~/dev/dreemdev`

```bash
cd ~/dev/dreemdev

# Replace ETA444 with your GitHub username if different
git clone git@github.com:ETA444/dreemcorp.git
```

After cloning:

```bash
cd dreemcorp
git status
```

### 5.2 Clone other staple repos

From your chosen base folder (`~/dev/dreemdev` or `~/dev/projects`):

```bash
cd ~/dev/projects   # or cd ~/dev/dreemdev

# Example additional clones
# (replace ETA444 and repo names as needed)
git clone git@github.com:ETA444/datasafari.git
git clone git@github.com:ETA444/georgedreemer.com.git
```



