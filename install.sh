#!/bin/bash

os=`uname`

if [ $os == "Darwin" ]
then
  # todo check for coreutils first
  # brew list coreutils
  current_dir=$(dirname $(greadlink -f "$0"))
  sublime_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
else
  current_dir=$(dirname $(readlink -f "$0"))
fi

echo "> Current OS is $os"

# think about having different installation file for different things
# think about setting zsh $ZSHHOME and $ZPREZTO or something variable

echo
echo '# Installing home files'
# install *sh files in home directory
for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  ln -vfns "$current_dir/$location" "$HOME/$file"
done | column -s'->' -t

# Vim
echo
echo '# Installing vim'

# Sublime Text 3
echo
echo '# Installing Sublime Text'
# if present give instructions
# - remove directory - have a choice (Y/N)
# - open sublime > enter license > install package control > close sublime
# - continue

rm -r "$sublime_dir"
ln -vfns "$current_dir/sublime/User" "$sublime_dir"

