#!/usr/bin/env bash
# Dotfiles Bootstrap — https://github.com/AnferneeDev/dotfiles
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/AnferneeDev/dotfiles/main/setup.sh)

set -euo pipefail

DOTFILES_REPO="https://github.com/AnferneeDev/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo ""
echo "  ========================================"
echo "  [INIT] ANFERNEE'S DOTFILES INSTALLER"
echo "  ========================================"
echo ""

# DEPENDENCY INSTALLATION: Install git and ansible
echo "[INIT] Installing git and ansible..."
if command -v apt-get &>/dev/null; then
  sudo apt update -qq
  sudo apt install -y -qq git ansible > /dev/null 2>&1
elif command -v dnf &>/dev/null; then
  sudo dnf install -y -q git ansible > /dev/null 2>&1
else
  echo "[ERROR] Unsupported package manager. Please install git and ansible manually."
  exit 1
fi
echo "[OK] git and ansible installed"

# REPOSITORY CLONING: Clone dotfiles from GitHub
if [ -d "$DOTFILES_DIR" ]; then
  echo "[SKIP] Dotfiles already cloned at $DOTFILES_DIR, pulling latest..."
  git -C "$DOTFILES_DIR" pull --rebase --quiet
else
  echo "[INIT] Cloning dotfiles..."
  git clone --depth 1 "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
echo "[OK] Dotfiles ready"

# PLAYBOOK RUNNING: Run ansible playbook
echo ""
echo "[INIT] Running Ansible playbook (sudo password required)..."
echo ""
cd "$DOTFILES_DIR"
ansible-playbook playbook.yml --ask-become-pass

echo ""
echo "  ========================================"
echo "  [OK] SETUP COMPLETE"
echo "  ========================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: exec zsh"
echo "  2. Add API keys to ~/.zshrc"
echo "  3. Set up SSH keys"
echo "  4. Run: aws configure"
echo ""
