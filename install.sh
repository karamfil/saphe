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

link()
{
  from="$1"
  to="$2"
  echo "Linking $from > $to"
  ln -fns "$from" "$to"
}

# think about having different installation file for different things
# think about setting zsh $ZSHHOME and $ZPREZTO or something variable

echo
echo '# Installing home files'
# install *sh files in home directory
for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$current_dir/$location" "$HOME/$file"
done | column -s'>' -t

# Sublime Text 3
echo
echo '# Installing Sublime Text'
# if present give instructions
# - remove directory - have a choice (Y/N)
# - open sublime > enter license > install package control > close sublime
# - continue

echo "$sublime_dir"
rm -r "$sublime_dir"
link "$current_dir/sublime/User" "$sublime_dir"

# install sublime packages
# for location in $(find home -name '.*'); do
#   file="${location##*/}"
#   file="${file%.sh}"
#   link "$current_dir/$location" "$HOME/$file"
# done | column -s'>' -t
