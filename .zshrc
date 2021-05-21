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

# Setup for Rust
source "$HOME/.cargo/env"

# C Tools lecture support
if [ "$ARCH" = '' ]
then
  ARCH=`arch`
fi
export TOOLDIR=$HOME/c-tools
export PATH="$TOOLDIR/bin:$TOOLDIR/bin/$ARCH:$PATH"
if [ "$MANPATH" = '' ]
then
  export MANPATH=$TOOLDIR/man
else
  export MANPATH=${MANPATH}:$TOOLDIR/man
fi

# Initialise Starship
eval "$(starship init zsh)"
