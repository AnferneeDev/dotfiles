# Dotfiles managed — https://github.com/AnferneeDev/dotfiles

# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Java (uncomment if needed)
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
# export PATH=$PATH:$JAVA_HOME/bin

# === Add your API keys below (not tracked by git) ===
# export DEEPSEEK_API_KEY="your-key-here"

# === Add machine-specific paths below ===
# export ANDROID_HOME="/path/to/android/sdk"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
