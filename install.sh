#!/usr/bin/env bash
# must be runned with root privileges

# I stopped backuping as i can revert my changes from git tree
#function backup {
#	mkdir $INSTALL_PATH/backup
#	mv $INSTALL_PATH/*nix $INSTALL_PATH/backup
#}

function installConfiguration {
#	backup
	cp *nix $INSTALL_PATH/
}

if [ -f "/mnt/etc/nixos/configuration.nix" -a -f "/mnt/etc/nixos/hardware-configuration.nix" ]; then	
    INSTALL_PATH=/mnt/etc/nixos
	installConfiguration
	# regenerate hardware-config
	nixos-generate-config --root /mnt
	nixos-install
	echo "\n\n      Installation finished!"
else
	INSTALL_PATH=/etc/nixos
	installConfiguration
	# regenerate hardware-config
	nixos-generate-config --root /
fi

