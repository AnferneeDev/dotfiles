# Anfernee's Dotfiles

> One command. Any Debian/Ubuntu machine. Ready to code.

## Quick Start

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/AnferneeDev/dotfiles/main/setup.sh)
```

This will:
1. Install `git` and `ansible`
2. Clone this repo to `~/dotfiles`
3. Run the Ansible playbook (asks for sudo password once)
4. Configure your entire dev environment

## What's Included

| Component | Details |
|:----------|:--------|
| **Shell** | Zsh + Oh My Zsh (theme: `bira`) |
| **Plugins** | `zsh-autosuggestions`, `zsh-syntax-highlighting` |
| **Custom Themes** | Sonokai Atlantis (`sanakai`, `sonokai`, `ys-dark`) |
| **Editor** | Neovim + LazyVim (colorscheme: Everforest) |
| **Multiplexer** | Tmux (prefix: `Ctrl+Space`, vim keybinds) |
| **Font** | JetBrains Mono Nerd Font |
| **Node** | NVM + Node.js 20 LTS |
| **Python** | uv (Astral) |
| **JS Runtime** | Bun |
| **Git** | Custom aliases, global gitignore (AI files, logs, keys) |
| **Tools** | LazyGit, OpenCode |

## Ansible Roles

Roles run in this order:

```
1. base     → Core packages (curl, git, zsh, tmux, ripgrep, fd-find...)
2. fonts    → JetBrains Mono Nerd Font
3. zsh      → Oh My Zsh + plugins + custom themes + .zshrc
4. git      → .gitconfig + .gitignore_global
5. tmux     → .tmux.conf (Ctrl+Space, vim splits, status styling)
6. node     → NVM + Node.js 20
7. neovim   → Neovim + full LazyVim config + Everforest
8. tools    → uv, lazygit, bun, opencode config
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
<summary>Everforest — Windows Terminal scheme</summary>

Add to `"schemes"` array:
```json
{
    "name": "Everforest",
    "background": "#2D353B",
    "foreground": "#D3C6AA",
    "black": "#475054",
    "red": "#E67E80",
    "green": "#A7C080",
    "yellow": "#DBBC7F",
    "blue": "#7FBBB3",
    "purple": "#D699B6",
    "cyan": "#83C092",
    "white": "#D3C6AA",
    "brightBlack": "#475054",
    "brightRed": "#E67E80",
    "brightGreen": "#A7C080",
    "brightYellow": "#DBBC7F",
    "brightBlue": "#7FBBB3",
    "brightPurple": "#D699B6",
    "brightCyan": "#83C092",
    "brightWhite": "#D3C6AA"
}
```

Then set `"colorScheme": "Everforest"` in your Debian profile.

</details>

## Re-running

The playbook is idempotent — run it again anytime to update:

```bash
cd ~/dotfiles && ansible-playbook playbook.yml --ask-become-pass
```

## License

MIT
