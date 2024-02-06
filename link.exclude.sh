#!/usr/bin/env bash

. "$( pwd )/utils.exclude.sh"

exclude_regex='\.$|\.\.$|\.exclude*|\.git$|.gitignore|^\.git/|.DS_Store|README.md|backups'

function link() {
  # Links all files in the current directory to $HOME, preserving 
  # directory structure.

  for file in $(traverse "$PWD" | grep -vE $exclude_regex)
  do
    source_path="$PWD/$file"
    backup_path="$PWD/backups/$file"
    backup_dir=${backup_path%/$(basename "$file")}

    if [[ ! $file =~ ^\. ]] ; then
      file=".$file"
    fi

    symlink_path="$HOME/$file"
    symlink_dir=${symlink_path%/$(basename "$file")}

    # copy the old files to a local backup path
    [[ -e "${symlink_path}" ]] && copydeep ${symlink_path} ${backup_dir}

    # link all the dotfiles to the given symlink_path
    mkdir -p "${symlink_dir}" && ln -svf ${source_path} ${symlink_path}
  done
}

function traverse() {
  # Returns the paths relative to $1, of all files contained in $1.
  # Args
  # $1 - the path to start the traversal from.

  find $1 -type f -print0 | while read -d $'\0' file
  do
   path="$(cd "$(dirname "$file")"; pwd -P)/$(basename "$file")"
   echo "${path#*$PWD/}"
  done
}

function main() {
  execute_func_with_prompt link "link all your new dotfiles"
}

main
# TODO: Add -i flag to decide whether to pass -i to ln
