#!/bin/bash
set -e

EXCLUDE_DIR="install_scripts"
DIRECTORIES=()
CMD="stow"

mapfile -t DIRECTORIES < <(find . -maxdepth 1 -type d -not -name "$EXCLUDE_DIR" -not -name '.*' -printf '%f\n')

for dir in "${DIRECTORIES[@]}"; do
	if [ "$dir" != "." ]; then
		eval "$CMD" "$dir"
	fi
done
