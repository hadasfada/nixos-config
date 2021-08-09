#!/usr/bin/env bash
#!nix-shell -p papermc

startServer() {
    worldPath=$1
    pushd $1
    minecraft-server
    popd
    # Drop nix-shell
    exit
}
