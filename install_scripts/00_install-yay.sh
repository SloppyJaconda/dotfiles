#!/bin/bash
set -e

sudo pacman -S --needed git base-devel --noconfirm
if [$? -eq 0]; then
	echo "failed to install yay prereqs"
else
	echo "yay prereqs installed"
fi

pushd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

popd

if [$? -eq 0]; then
	echo "yay should be installed"
else
	echo "potential problem installing yay"
fi
