#!/bin/bash

projects=(
  "obsidian-iconize:$HOME/Desktop/obsidian-icon-folder/"
)

if [ -n "$1" ]; then
  index="$1"
else
  PS3="Select a project: "
  select project in "${projects[@]}"; do
    if [ -n "$project" ]; then
      index="$REPLY"
      break
    else
      echo "Invalid selection, please try again."
    fi
  done
fi

if [ "$index" -ge 1 ] && [ "$index" -le "${#projects[@]}" ]; then
  IFS=':' read -ra project_info <<< "${projects[$index - 1]}"
  project_name="${project_info[0]}"
  project_path="${project_info[1]}"

  cd "$project_path"
  tmux new-session -s "$project_name" 
  exit
else
  echo "Invalid selection. Please provide a valid index or select one from the list."
fi

