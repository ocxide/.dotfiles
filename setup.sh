#!/usr/bin/env bash

# Remove existing symlink
function removesymlink() {
	if [ -z "$1" ]; then
	 echo "WHAT ARE YOU TRYING TO DO?!?"
	 exit 1
	fi

 	if [ -f "$1" ]; then
	 echo "File $1 already exists - skiping"
 	elif [ -L "$1" ]; then
	 rm -rf --preserve-root "$1" > /dev/null 2>&1
	elif [ -d "$1" ]; then
		echo "Directory $1 already exists - skiping"
	fi
}

removesymlink ~/.config/tmux

# Create symlinks 
ln -sf ~/projects/.dotfiles/tmux/ ~/.config/tmux
