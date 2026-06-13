#!/usr/bin/env bash
# Dotfiles Bootstrap — https://github.com/AnferneeDev/dotfiles
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/AnferneeDev/dotfiles/main/setup.sh)

set -euo pipefail

DOTFILES_REPO="https://github.com/AnferneeDev/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║   🚀 Anfernee's Dotfiles Installer   ║"
echo "  ╚══════════════════════════════════════╝"
echo ""

# ── Install dependencies ──────────────────────────────────────────────
echo "→ Installing git and ansible..."
sudo apt update -qq
sudo apt install -y -qq git ansible > /dev/null 2>&1
echo "  ✔ git and ansible installed"

# ── Clone dotfiles ────────────────────────────────────────────────────
if [ -d "$DOTFILES_DIR" ]; then
  echo "→ Dotfiles already cloned at $DOTFILES_DIR, pulling latest..."
  git -C "$DOTFILES_DIR" pull --rebase --quiet
else
  echo "→ Cloning dotfiles..."
  git clone --depth 1 "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
echo "  ✔ Dotfiles ready"

# ── Run playbook ──────────────────────────────────────────────────────
echo ""
echo "→ Running Ansible playbook (sudo password required)..."
echo ""
cd "$DOTFILES_DIR"
ansible-playbook playbook.yml --ask-become-pass

echo ""
echo "  ╔══════════════════════════════════════╗"
echo "  ║        ✅ Setup Complete!             ║"
echo "  ╚══════════════════════════════════════╝"
echo ""
echo "  Next steps:"
echo "    1. Restart your terminal or run: exec zsh"
echo "    2. Add API keys to ~/.zshrc"
echo "    3. Set up SSH keys"
echo "    4. Run: aws configure"
echo ""
