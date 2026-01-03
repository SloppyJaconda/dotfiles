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

echo "Don't forget to update sddm to use silent

sudoedit /etc/sddm.conf

    # Make sure these options are correct:
    [General]
    InputMethod=qtvirtualkeyboard
    GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

    [Theme]
    Current=silent


    ALSO
        copy the .face file to /usr/share/sddm/faces/ and save it as <username>.faces.icon

    ALSO ALSO - hyprshell isn't included in this install script because it requires additional params to be passed in. Install it with:
    'ZSTD_SYS_USE_PKG_CONFIG=1 yay hyprshell'
    
    "
