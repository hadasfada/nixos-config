#!/usr/bin/env bash
# must be runned with root privileges

function backup {
	mkdir $INSTALL_PATH/backup
	mv $INSTALL_PATH/*nix $INSTALL_PATH/backup
}

function installConfiguration {
	backup
	mv $INSTALL_PATH/hardware-configuration.nix $INSTALL_PATH/hwconf.txt
	rm $INSTALL_PATH/*nix
	mv *nix $INSTALL_PATH/
	mv $INSTALL_PATH hwconf.txt hardware-configuration.nix
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
fi

