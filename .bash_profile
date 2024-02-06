#!/bin/bash


# ----- Bash Prompt Customisation ----- #
# Saved old PS1 to oldps1, and added new PS1
export oldps1="\h:\W \u\$"
export PS1="\u:\W \e[0;36m>>\e[m "

# ----- Sourcing ----- #
source ~/.exports
source ~/.functions
source ~/.aliases

# ----- More Language Stuff ----- #

# Setup for nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup for pyenv
eval "$(pyenv init -)"

# Setup for Rust
. "$HOME/.cargo/env"
