#!/bin/bash


# ----- Bash Prompt Customisation ----- #
# Saved old PS1 to oldps1, and added new PS1
export oldps1="\h:\W \u\$"
export PS1="\u:\W \e[0;36m>>\e[m "


# ----- Language Stuff ----- #
# add cabal binary path - this is to install haskell-language-server
export PATH="~/.cabal/bin:$PATH"

# Setup for pyenv
eval "$(pyenv init -)"


# ----- Sourcing ----- #
source ~/.exports
source ~/.functions
source ~/.aliases

