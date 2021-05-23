#!/usr/bin/env bash

. "$( pwd )/utils.exlude.sh"

install_and_update_brew() {
  local os=$(get_os)
  if [ "$os" = 'darwin' ] ; then
    which brew 1>&/dev/null
    if [ ! $? -eq 0 ] ; then
      echo_with_prompt "Homebrew is not installed! Attempting to install it..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      if [ ! "$?" -eq 0 ] ; then
		echo_with_prompt "Something went wrong. Exiting..." && exit 1
	  fi
    fi

  brew update
  fi
}
