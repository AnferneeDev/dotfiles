# Sonokai Atlantis Theme for Oh My Zsh

# Color definitions using Sonokai Atlantis Palette
local SNK_RED="%F{#ff6578}"
local SNK_ORANGE="%F{#f69c5e}"
local SNK_YELLOW="%F{#eacb64}"
local SNK_GREEN="%F{#9dd274}"
local SNK_BLUE="%F{#72cce8}"
local SNK_PURPLE="%F{#ba9cf3}"
local SNK_GREY="%F{#828a9a}"
local SNK_RESET="%f"

ZSH_THEME_GIT_PROMPT_PREFIX=" ${SNK_GREY}git:(${SNK_RED}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${SNK_GREY})${SNK_RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${SNK_YELLOW}✗${SNK_RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ${SNK_GREEN}✔${SNK_RESET}"

PROMPT="${SNK_GREEN}%n${SNK_GREY}@${SNK_BLUE}%m ${SNK_YELLOW}%~${SNK_RESET}\$(git_prompt_info)
${SNK_PURPLE}❯${SNK_RESET} "
