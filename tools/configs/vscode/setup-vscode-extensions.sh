#!/usr/bin/env bash
set -e

echo "Installing VS Code extensions for Python, Data, ML & Dev..."

#########################
# Python & Data Science #
#########################

code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.jupyter
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.datawrangler
code --install-extension ms-toolsai.python-ds-extension-pack

################################
# Code Quality, Typing & Tasks #
################################

code --install-extension charliermarsh.ruff
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.flake8
code --install-extension ms-vscode.makefile-tools

#########################
# Git & Version Control #
#########################

code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension donjayamanne.githistory
code --install-extension github.vscode-pull-request-github

##############################
# Remote, Containers & Infra #
##############################

code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-azuretools.vscode-docker
code --install-extension hashicorp.terraform
code --install-extension iterative.dvc

########################
# Productivity & Files #
########################

code --install-extension tamasfe.even-better-toml
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode.todo-tree
code --install-extension esbenp.prettier-vscode
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension sleistner.vscode-fileutils
code --install-extension usernamehw.errorlens
code --install-extension ms-vscode.live-server

##########################
# AI / Code Intelligence #
##########################

code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat
code --install-extension Continue.continue
code --install-extension TabNine.tabnine-vscode

############################
# Web / JS / TS / Solidity #
############################

code --install-extension dbaeumer.vscode-eslint
code --install-extension meganrogge.template-string-converter
code --install-extension JuanBlanco.solidity

#######################
# Themes & Appearance #
#######################

code --install-extension dracula-theme.theme-dracula
code --install-extension pkief.material-icon-theme
code --install-extension zhuangtongfa.Material-theme      # One Dark Pro style
code --install-extension enkia.tokyo-night                # Tokyo Night

echo "Done. Restart VS Code if it was open."
