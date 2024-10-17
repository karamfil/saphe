#!/bin/bash

# TODO
# - Have an executable file with its own actions and dependencies like nvim
# - Get rid of ZSH Prezto (https://zimfw.sh/)
# - use stow https://www.gnu.org/software/stow/
#			https://www.youtube.com/watch?v=ZQ55lqi5IYw

# add config osx systems settings
# add config alfred (~/Library/Application Support/Alfred/Alfred.alfredpreferences/preferences)
# x add config finicky
# x add config aerospace
# add config ice /Users/karamfil/Library/Preferences/com.jordanbaird.Ice.plist
# add config dbeaver (careful with passwords)

# add manual config browserosaurus
# add manual config iStatsMenu
# add manual config hosts (helm)
# add manual config vscode - use sync settings

# add config remapping keys (±/~)
# 	https://gist.github.com/bennlee/0f5bc8dc15a53b2cc1c81cd92363bf18?permalink_comment_id=5100184#gistcomment-5100184
#	https://www.reddit.com/r/MacOS/comments/18g4vxn/cannot_remap_keys_on_macbook_pro_with_hidutils_in/
#	hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'
# 		{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},
#		{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]


os=`uname`

echo
echo "> Current OS is $os"
echo 

if [ $os == "Darwin" ]; then
	echo "# Package Manager"
	if ! [ -x "$(command -v brew)" ]; then
		echo "Package manager 'brew' is not installed"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/opt/homebrew/bin/brew shellenv)"

		# setup autoupdate
		brew tap domt4/autoupdate
		brew install pinentry-mac
		brew autoupdate start 86400 --upgrade --cleanup --immediate --sudo
	else
		echo "Package Manager 'brew' is already installed"
	fi
	
	echo
	echo "# Installing brew package depenencies"
	
	# install main deps (move some of these to particular installer)
	for pkg in coreutils gnu-sed gawk grep ripgrep ack ctags tmux neovim zsh jordanbaird-ice; do
		# todo add a force update flag
		if brew list -1 | grep -q "^${pkg}\$"; then
			echo "Package '$pkg' is installed"
		else
			echo "Package '$pkg' is not installed"
			brew install $pkg
		fi
	done

	# install as cask
	for pkg in browserosaurus finicky; do
		# todo add a force update flag
		if brew list -1 | grep -q "^${pkg}\$"; then
			echo "Package '$pkg' is already installed"
		else
			echo "Package '$pkg' is not installed"
			brew install --cask $pkg
		fi
	done
else
	echo "Non OSX is not yet supported"
	
	exit 1
fi

# echo
# echo '# Update submodules'
# git submodule sync
# git submodule update --init --recursive --remote

echo
bash ./_installers/home.sh
bash ./_installers/neovim.sh
