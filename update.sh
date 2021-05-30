#!/usr/bin/env bash

REPODIR=$HOME/dotfiles-nixos
INPUT=$1

if [ -n "$INPUT" ]; then
	COMMIT_MESSAGE="$INPUT"
else
	COMMIT_MESSAGE="update"
fi

function update() {
	rm -f *.nix
	cp /etc/nixos/* ./
	rm hardware-configuration.nix
}

function commit() {
	git pull
	git add *
	git commit -m "$COMMIT_MESSAGE"
	git push
}

pushd $REPODIR
update
commit
popd
