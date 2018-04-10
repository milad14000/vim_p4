#!/bin/sh

# An installation script for vim_p4

basedir=~/.vim
repository="bluejumper/vim_p4"

# basedir for other vim-like editors here.
if [ "$EDITOR" = "nvim" ]; then
	basedir=~/.config/nvim
fi

mkdir $basedir/ftdetect 2> /dev/null
mkdir $basedir/syntax 2> /dev/null

# Get and export files.
wget -qO- https://raw.githubusercontent.com/$repository/master/ftdetect/p4.vim > $basedir/ftdetect/p4.vim
wget -qO- https://raw.githubusercontent.com/$repository/master/syntax/p4.vim > $basedir/syntax/p4.vim
