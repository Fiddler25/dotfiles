all: init link zsh brew

init:
	.bin/init.sh

link:
	.bin/link.sh

zsh:
	.bin/zsh.sh

brew:
	.bin/brew.sh