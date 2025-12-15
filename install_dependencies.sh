#!/bin/bash

files=(./install_scripts/*.sh)
echo "executing ${#files[@]} scripts"

for file in "${files[@]}"; do 
	if [ -f "$file" ] && [ -x "$file" ]; then
		./"$file"
	else
		echo "$file could not be executed"
	fi
done
