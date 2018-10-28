#!/bin/sh

os=`uname`

if [ $os == "Darwin" ]
then
  # todo check for coreutils first
  # brew list coreutils
  current_dir=$(dirname $(greadlink -f "$0"))
else
  current_dir=$(dirname $(readlink -f "$0"))
fi

echo "Current OS is $os"

link()
{
  from="$1"
  to="$2"
  echo "Linking $from > $to"
  rm -f "$to"
  ln -s "$from" "$to"
}

# think about having different installation file for different things
# think about setting zsh $ZSHHOME and $ZPREZTO or something variable

# install *sh files in home directory
for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$current_dir/$location" "$HOME/$file"
done | column -s'>' -t


# install sublime packages
# for location in $(find home -name '.*'); do
#   file="${location##*/}"
#   file="${file%.sh}"
#   link "$current_dir/$location" "$HOME/$file"
# done | column -s'>' -t