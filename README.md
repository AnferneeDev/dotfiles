# Anfernee's Dotfiles

<p align="center">
  <img src="https://img.shields.io/badge/platform-debian%20%7C%20ubuntu%20%7C%20al2023-E95420?style=flat-square" alt="Platform">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square" alt="License">
  <img src="https://img.shields.io/badge/automation-ansible-red?style=flat-square" alt="Ansible">
</p>

> One command. Any machine. Ready to code.

## Quick Start

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/AnferneeDev/dotfiles/main/setup.sh)
```

This will:
1. Install `git` and `ansible`
2. Clone this repo to `~/dotfiles`
3. Run the Ansible playbook (asks for sudo password once)
4. Configure your entire dev environment

## Why This Exists

- **Laptop died? New job?** → One command and you're back.
- **WSL fresh install?** → Same dotfiles, same experience.
- **Colleague wants your setup?** → They run the same one-liner.

## What's Included

| Component | Details |
|:----------|:--------|
| **Shell** | Zsh + Oh My Zsh (theme: `bira`) |
| **Plugins** | `zsh-autosuggestions`, `zsh-syntax-highlighting` |
| **Custom Themes** | Sonokai Atlantis (`sanakai`, `sonokai`, `ys-dark`) |
| **Editor** | Neovim + LazyVim (colorscheme: Rosé Pine Dawn) |
| **Multiplexer** | Tmux (prefix: `Ctrl+Space`, vim keybinds) |
| **Font** | JetBrains Mono Nerd Font |
| **Node** | NVM + Node.js 20 LTS |
| **Python** | uv (Astral) |
| **JS Runtime** | Bun |
| **Git** | Custom aliases, global gitignore (AI files, logs, keys) |
| **Tools** | LazyGit, OpenCode |

## Supported Platforms

| OS | Version | Status |
|:---|---:|:---|
| Debian | 11+ | Tested |
| Ubuntu | 20.04+ | Tested |
| Amazon Linux 2023 | AL2023 | Tested |
| RedHat | 8+ | Tested |

## Ansible Roles

Roles run in this order:

```
1. base     → Core packages (curl, git, zsh, tmux, ripgrep, fd-find...)
2. fonts    → JetBrains Mono Nerd Font
3. zsh      → Oh My Zsh + plugins + custom themes + .zshrc
4. git      → .gitconfig + .gitignore_global
5. tmux     → .tmux.conf (Ctrl+Space, vim splits, status styling)
6. node     → NVM + Node.js 20
7. neovim   → Neovim + full LazyVim config + Rosé Pine Dawn
8. tools    → uv, lazygit, bun, opencode config
```

## Repository Structure

```
dotfiles/
├── playbook.yml          # Main Ansible playbook
├── setup.sh              # One-liner bootstrap script
├── roles/
│   ├── base/             # Core system packages
│   ├── fonts/            # Nerd Font installation
│   ├── zsh/              # Shell config + themes
│   ├── git/              # Git aliases + ignore rules
│   ├── tmux/             # Terminal multiplexer
│   ├── node/             # NVM + Node.js
│   ├── neovim/           # Editor + LazyVim
│   └── tools/            # uv, lazygit, bun, opencode
└── .config/
    └── opencode/         # OpenCode AI configuration
```

## Post-Install (Manual)

After the playbook runs, you'll need to set up secrets manually:

```bash
# 1. Add API keys to ~/.zshrc
echo 'export DEEPSEEK_API_KEY="your-key"' >> ~/.zshrc

# 2. Set up SSH keys
ssh-keygen -t ed25519 -C "your-email@example.com"

# 3. Configure AWS
aws configure

# 4. Log in to AI tools
# claude, copilot, ngrok, etc.
```

## Windows Terminal (WSL)

If you're on WSL, add this color scheme to your Windows Terminal `settings.json`:

<details>
<summary>Rosé Pine Dawn (Pinker) — Windows Terminal scheme</summary>

Add to `"schemes"` array:
```json
{
    "name": "Rosé Pine Dawn (Pinker)",
    "background": "#f5e6eb",
    "foreground": "#575279",
    "cursorColor": "#9893a5",
    "selectionBackground": "#dfdad9",
    "black": "#f2e9e1",
    "red": "#b4637a",
    "green": "#286983",
    "yellow": "#a67500",
    "blue": "#205798",
    "purple": "#7a4b85",
    "cyan": "#025763",
    "white": "#575279",
    "brightBlack": "#797593",
    "brightRed": "#b4637a",
    "brightGreen": "#286983",
    "brightYellow": "#ea9d34",
    "brightBlue": "#56949f",
    "brightPurple": "#907aa9",
    "brightCyan": "#d7827e",
    "brightWhite": "#575279"
}
```

Then set `"colorScheme": "Rosé Pine Dawn (Pinker)"` in your Debian profile.

</details>

## Re-running

The playbook is idempotent — run it again anytime to update:

```bash
cd ~/dotfiles && ansible-playbook playbook.yml --ask-become-pass
```

## License

MIT
