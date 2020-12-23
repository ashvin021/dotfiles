
# add cabal binary path - this is to install haskell-language-server
export PATH="~/.cabal/bin:$PATH"

# added by Miniconda3 4.3.11 installer
export PATH="/Users/ash_21/miniconda3/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#Saved old PS1 to oldps1, and added new PS1
export oldps1="\h:\W \u\$"
export PS1="\u:\W \e[0;36m>>\e[m "

# Adding aliases, to use NeoVim instead of the regular vim in macOS.
alias vi="vim"
alias vim='/usr/local/bin/nvim'

#Some git related aliases
alias gpom="git push origin master"
alias gs="git status"

#Alias gcc to gcc instead of clang on Mac
alias gcc="gcc-10"
