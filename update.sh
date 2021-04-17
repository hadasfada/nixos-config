DATE=$(date +"%d-%m-%Y %T")
REPODIR=$HOME/Git/dotfiles-nixos

function update() {
	pushd $REPODIR
	rm -f *.nix
	cp -a /etc/nixos/* ./
	popd
}

function commit() {
	pushd $REPODIR
	git pull
	git add *
	git commit -m "update $DATE"
	git push
	popd
}

update
commit

