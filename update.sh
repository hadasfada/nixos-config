#!/usr/bin/env bash

REPODIR=$HOME/dotfiles-nixos
COMMIT_MESSAGE=$1

function update() {
	pushd $REPODIR
	rm -f *.nix
	cp /etc/nixos/* ./
	rm hardware-configuration.nix
	popd
}

function commit() {
	pushd $REPODIR
	git pull
	git add *
	git commit -m "update $COMMIT_MESSAGE"
	git push
	popd
}

update
commit

