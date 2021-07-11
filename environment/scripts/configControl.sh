# If we run script with "sudo", $HOME will change to /root

installConfig() {
    pushd $repo
    sudo rm -rf $installDir/*
	sudo cp -a * $installDir/
	sudo rm $installDir/{LICENSE,README.md}
    popd
}

applyConfig() {
    repo=$HOME/.nixos-config
    installDir=/mnt/etc/nixos
    if [ -f "$installDir/configuration.nix" -a -f "$installDir/hardware-configuration.nix" ]; then
	    installConfig
	    # regenerate hardware-config
	    sudo nixos-generate-config --root /mnt
	    # add home-manager channel
	    sudo nix-channel --add \
            https://github.com/nix-community/home-manager/archive/master.tar.gz \
            home-manager
	    sudo nix-channel --update
	    # install NixOS
	    sudo nixos-install
    else
	    installDir=/etc/nixos
	    installConfiguration
	    # regenerate hardware-config
	    nixos-generate-config --root /
    fi
}
