#!/usr/bin/env bash

. "$( pwd )/utils.exclude.sh"

update_packages() {
  local os=$(get_os)

  if [ "$os" = "darwin" ] ; then
    $install_and_update_brew
  fi

  if [ "$os" = "linux" ] ; then
    $(sudo apt-get update)
  fi
}

install_vim() {
  local os=$(get_os)
  local editor=""

  echo_with_prompt "Do you want to use neovim, or proceed with vim? [y/n]"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    editor="nvim"
  else
    editor="vim"
  fi

  which "$editor" 1>&/dev/null
  if [ ! $? -eq 0 ] ; then
    if [ "$os" = "darwin" ] ; then
      echo_with_prompt "Installing "$editor" with brew..."
      brew install "$editor"
    fi
  else
    if [ "$os" = "darwin" ] ; then
      echo_with_prompt "Upgrading "$editor" with brew..."
      brew upgrade "$editor"
      if [ ! $? -eq 0 ] ; then
        echo_with_prompt "Installing "$editor" with brew..."
        brew install "$editor"
      fi
    fi
    if [ "$os" = "linux" ] ; then
      echo_with_prompt "Installing "$editor" with apt-get..."
      if [ "$editor" = "vim" ] ; then
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt update
      fi
      sudo apt-get install "$editor"
    fi
  fi
  echo_with_prompt "Done!"
}


update_packages
install_vim
