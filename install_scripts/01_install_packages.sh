#!/bin/bash
set -e

PACKAGE_FILE="$(dirname "$0")/packages.txt"

if [ ! -f "$PACKAGE_FILE" ]; then
	echo "Error: no package file."
	exit 1
fi

install_packages() {
	local packages=("$@")
	if [ ${#packages[@]} -eq 0 ]; then
		return 0
	fi

	if command -v yay &> /dev/null; then
		cmd="yay -Syu --needed --noconfirm"
		echo "----- using yay for installation"
	else
		cmd="sudo pacman -Syu --needed --noconfirm"
		echo "----- using pacman for installation"
	fi

	echo "----- attempting to install : ${packages[*]}"
	eval "$cmd" "${packages[@]}"

	if [ $? -eq 0 ]; then
		echo "----- success"
	else
		echo "----- failed to install"
		exit 1
	fi
}

readarray -t PACKAGES < <(grep -vE '^\s*($|#)' "$PACKAGE_FILE")
if [ ${#PACKAGES[@]} -eq 0 ]; then
	echo "----- no packages found"
	exit 0
fi

install_packages "${PACKAGES[@]}"
echo "---- completed"
