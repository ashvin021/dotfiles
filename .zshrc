#!/bin/zsh

# ----- Sourcing ----- #
source ~/.exports
source ~/.functions
source ~/.aliases

# ----- More Language Stuff! ----- #

# Setup for pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Setup for Rust
# source "$HOME/.cargo/env"

# Setup for VTunes profiler
# source /opt/intel/oneapi/setvars.sh

# Initialise Starship
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
