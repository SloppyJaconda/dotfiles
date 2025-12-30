#!/bin/bash
set -e

CMD="stow"


EXCLUDE_DIR=("install_scripts" "nvim")
DIRECTORIES=()

# 1. Build the find filter dynamically
find_filter=()
for dir in "${EXCLUDE_DIR[@]}"; do
    find_filter+=( -not -name "$dir" )
done

# 2. Execute with the expanded filter
# Using -print0 and mapfile -d '' is safer for filenames with spaces
mapfile -d '' DIRECTORIES < <(find . -maxdepth 1 -type d "${find_filter[@]}" -not -name '.*' -printf '%f\0')


for dir in "${DIRECTORIES[@]}"; do
	if [ "$dir" != "." ]; then
		eval "$CMD" "$dir"
	fi
done
