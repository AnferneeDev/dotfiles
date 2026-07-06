# ZSH CONFIGURATION
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Standalone plugins (no Oh My Zsh)
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH="/home/Anfernee/.opencode/bin:$PATH"

# Android SDK
export ANDROID_HOME="/mnt/c/Users/anfer/AppData/Local/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Display system info on startup
fastfetch --logo ~/.config/my_ascii_art.txt

# Initialize Starship prompt
eval "$(starship init zsh)"
bindkey '^H' backward-kill-word
