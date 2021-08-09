# If we run script with "sudo", $HOME will change to /root

installConfig() {
    pushd $repo &>/dev/null
    sudo rm -rf $installDir/*
	sudo cp -a * $installDir/
	sudo rm $installDir/{LICENSE,README.md}
    popd &>/dev/null
}

runNix() {
    if [ $2 = "clean" ]; then
        sudo $1 &>/dev/null
    else
        sudo $1
    fi
}

applyConfig() {
    repo=$HOME/.nixos-config
    installDir=/mnt/etc/nixos
    if [ -f "$installDir/configuration.nix" -a -f "$installDir/hardware-configuration.nix" ]; then
	    installConfig
	    # regenerate hardware-config
	    runNix "nixos-generate-config --root /mnt" clean
	    # add home-manager channel
	    runNix "nix-channel --add \
            https://github.com/nix-community/home-manager/archive/master.tar.gz \
            home-manager" clean
	    runNix "nix-channel --update" clean
	    # install NixOS
	    runNix "nixos-install"
    else
	    installDir=/etc/nixos
	    installConfig
	    # regenerate hardware-config
	    runNix "nixos-generate-config --root /" clean
        runNix "nixos-rebuild switch"
    fi
}
