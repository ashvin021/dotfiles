#!/usr/bin/env bash

. "$( pwd )/utils.exclude.sh"

exclude_regex='\.$|\.\.$|\.exclude*|\.git$|.gitignore|^\.git/|.DS_Store|README.md|backups'

function link() {
  for file in $(traverse "$PWD" | grep -vE $exclude_regex)
  do
    target_path="$PWD/$file"
    backup_path="$PWD/backups/$file"
    if [[ ! $file =~ ^\. ]] ; then
      file=".$file"
    fi
    symlink_path="$HOME/$file"

    # copy the old files to a local backup path
    [[ -e "${symlink_path}" ]] && cpd ${symlink_path} ${backup_path}

    # link all the dotfiles to the given symlink_path
    ln -svfi ${target_path} ${symlink_path} || true
  done
}

function traverse() {
  find $1 -type f -print0 | while read -d $'\0' file
do
  path="$(cd "$(dirname "$file")"; pwd -P)/$(basename "$file")"
  echo "${path#*$PWD/}"
done
}

function cpd () {
  [ -z $1 ] || [ -z $2 ] && {
    printf "usage: cpd file /path/path1/etc...\n";
      return 1
    }
  mkdir -p "${2%/$(basename "$file")}" || {
    printf "error: unable to create directory '%s' (check write permission)\n" "$2";
      return 1
    }
  cp "$1" "$2"
}

function main() {
  execute_func_with_prompt link "link all your new dotfiles"
}

main

