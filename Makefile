all: init link zsh defaults brew

init:
	.bin/init.sh

link:
	.bin/link.sh

zsh:
	.bin/zsh.sh

defaults:
	.bin/defaults.sh

brew:
	.bin/brew.sh