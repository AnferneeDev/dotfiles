# ZSH CONFIGURATION: Main shell configuration file

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# MACHINE CONFIGURATION: Add local API keys and paths below
# export DEEPSEEK_API_KEY=""
# export ANDROID_HOME=""
# export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Display system info on startup
fastfetch --logo ~/.config/my_ascii_art.txt

# Initialize Starship prompt
eval "$(starship init zsh)"
