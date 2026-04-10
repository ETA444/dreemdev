#!/usr/bin/env bash
set -e

FORCE_FLAG=""

if [ "$1" = "--force" ]; then
  FORCE_FLAG="--force"
  echo "Installing/updating VS Code extensions (force mode)..."
else
  echo "Installing VS Code extensions (no force)..."
fi

############################
# Python & Data Science
############################

code --install-extension ms-python.python $FORCE_FLAG
code --install-extension ms-python.vscode-pylance $FORCE_FLAG
code --install-extension ms-toolsai.jupyter $FORCE_FLAG
code --install-extension ms-toolsai.datawrangler $FORCE_FLAG
code --install-extension ms-toolsai.python-ds-extension-pack $FORCE_FLAG

############################
# Code Quality, Typing & Tasks
############################

code --install-extension charliermarsh.ruff $FORCE_FLAG
code --install-extension ms-python.black-formatter $FORCE_FLAG
code --install-extension ms-python.isort $FORCE_FLAG
code --install-extension ms-python.flake8 $FORCE_FLAG
code --install-extension ms-vscode.makefile-tools $FORCE_FLAG

############################
# Git & Version Control
############################

code --install-extension eamodio.gitlens $FORCE_FLAG
code --install-extension mhutchie.git-graph $FORCE_FLAG
code --install-extension donjayamanne.githistory $FORCE_FLAG
code --install-extension github.vscode-pull-request-github $FORCE_FLAG

############################
# Remote, Containers & Infra
############################

code --install-extension ms-vscode-remote.remote-ssh $FORCE_FLAG
code --install-extension ms-vscode-remote.remote-containers $FORCE_FLAG
code --install-extension ms-azuretools.vscode-docker $FORCE_FLAG
code --install-extension hashicorp.terraform $FORCE_FLAG
code --install-extension iterative.dvc $FORCE_FLAG

############################
# Productivity & Files
############################

code --install-extension tamasfe.even-better-toml $FORCE_FLAG
code --install-extension redhat.vscode-yaml $FORCE_FLAG
code --install-extension Gruntfuggly.todo-tree $FORCE_FLAG
code --install-extension esbenp.prettier-vscode $FORCE_FLAG
code --install-extension streetsidesoftware.code-spell-checker $FORCE_FLAG
code --install-extension sleistner.vscode-fileutils $FORCE_FLAG
code --install-extension usernamehw.errorlens $FORCE_FLAG
code --install-extension ms-vscode.live-server $FORCE_FLAG

############################
# AI / Code Intelligence
############################

code --install-extension GitHub.copilot $FORCE_FLAG
code --install-extension GitHub.copilot-chat $FORCE_FLAG
code --install-extension Continue.continue $FORCE_FLAG
code --install-extension TabNine.tabnine-vscode $FORCE_FLAG

############################
# Web / JS / TS / Solidity
############################

code --install-extension dbaeumer.vscode-eslint $FORCE_FLAG
code --install-extension meganrogge.template-string-converter $FORCE_FLAG
code --install-extension JuanBlanco.solidity $FORCE_FLAG

############################
# Themes & Appearance
############################

code --install-extension dracula-theme.theme-dracula $FORCE_FLAG
code --install-extension pkief.material-icon-theme $FORCE_FLAG
code --install-extension zhuangtongfa.Material-theme $FORCE_FLAG
code --install-extension enkia.tokyo-night $FORCE_FLAG

echo "Done."
