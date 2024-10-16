#!/bin/bash

# TODO
# - Have an executable file with its own actions and dependencies like nvim
# - use stow https://www.gnu.org/software/stow/
#			https://www.youtube.com/watch?v=ZQ55lqi5IYw


os=`uname`

if [ $os == "Darwin" ]; then
	# install main deps
	echo "Installing brew package depenencies"
	for pkg in coreutils gnu-sed gawk grep ripgrep ack ctags tmux neovim zsh; do
		if brew list -1 | grep -q "^${pkg}\$"; then
			echo "Package '$pkg' is installed"
		else
			echo "Package '$pkg' is not installed"
			brew install $pkg
		fi
	done
	
	current_dir=$(dirname $(greadlink -f "$0"))
	sublime_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
else
	echo "this is not yet finished"
	
	exit 1
	
	sublime_dir=""
	current_dir=$(dirname $(readlink -f "$0"))
fi

echo
echo "> Current OS is $os"

echo
echo '# Update submodules'
git submodule sync
git submodule update --init --recursive --remote
# git submodule update --recursive --remote

# think about having different installation file for different things
# think about setting zsh $ZSHHOME and $ZPREZTO or something variable

echo
echo '# Installing home files'
# todo maybe move this to be ZSH only
# install *sh files in home directory
for location in $(find home -type l -name '*'); do
	file="${location##*/}"
	file="${file%.sh}"
	
	ln -vfns "$current_dir/$location" "$HOME/.$file"
done | column -s'->' -t

# Vim
echo
echo '# Installing vim + deps'

# install deps

rm -rf "$HOME/.vim"
ln -vfns "$current_dir/vim/janus/janus/vim" "$HOME/.vim"
ln -vfns "$current_dir/vim/vimrc.before" "$HOME/.vimrc.before"
ln -vfns "$current_dir/vim/vimrc.after" "$HOME/.vimrc.after"
ln -vfns "$current_dir/vim/janus-custom" "$HOME/.janus"
ln -vfns "$HOME/.vim/vimrc" "$HOME/.vimrc"

ln -vfns "/usr/local/bin/nvim" "/usr/local/bin/vi"
ln -vfns "/usr/local/bin/nvim" "/usr/local/bin/vim"
ln -vfns "/usr/local/bin/nvim" "/usr/local/bin/vimdiff"
ln -vfns "/usr/local/bin/nvim" "/usr/local/bin/view"

# # Sublime Text 3
# echo
# if [[ -L "$sublime_dir" ]]; then 
# 	echo '# Sublime Text is already linked'
# else
# 	echo '# Linking Sublime Text (destructive)'
# 	echo 'There will be more info for this later with better description and choice selector'
# 	# if present give instructions
# 	# - remove directory - have a choice (Y/N)
# 	# - open sublime > enter license > install package control > close sublime
# 	# - continue

# 	# rm -r "$sublime_dir"
# 	# ln -vfns "$current_dir/sublime/User" "$sublime_dir"
# fi
