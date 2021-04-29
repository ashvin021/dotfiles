#!/usr/bin/env bash

# Got this part from ajmalsiddiqui/dotfiles, lol.
# Utility functions for scripts used to sync / bootstrap the dotfiles.
 
echo_with_prompt () {
  PROMPT="${PROMPT:-[ .dotfiles ]}"
  echo "$PROMPT $@"
}

execute_func_with_prompt() {
  # Args
  # $1 - the function to call
  # $2 - the thing this function does
  # Returns 1 if the user cancels the operation
  # Returns 2 if the function failed
  # Returns 0 if all went well

	echo_with_prompt "This utility will $2"
	echo_with_prompt "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    # This thing here "calls" the function
    "$1" || return 2
		echo_with_prompt "$2 complete"
	else
		echo_with_prompt "$2 cancelled by user"
    return 1
	fi
}
