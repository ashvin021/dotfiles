#!/bin/zsh

# ----- Sourcing ----- #
source ~/.exports
source ~/.functions
source ~/.aliases

# ----- More Language Stuff! ----- #

# Setup for nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup for pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Initialise Starship
eval "$(starship init zsh)"
