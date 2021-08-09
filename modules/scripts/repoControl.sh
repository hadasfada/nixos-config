#!/usr/bin/env bash
#!nix-shell -p git

cloneConfigRepo() {
    git clone \
        https://github.com/musfay/nixos-config.git \
        $HOME/.nixos-config
}

editConfig() {
    codium $HOME/.nixos-config
}

pushConfig() {
    pushd $HOME/.nixos-config
    git push
    popd
}
