#!/bin/sh

os=`uname`
dir=$(dirname $(readlink -f "$0"))
echo "Current OS is $os"

link()
{
  from="$1"
  to="$2"
  echo "Linking $from > $to"
  rm -f "$to"
  ln -s "$from" "$to"
}


for location in $(find home -name '.*'); do
  file="${location##*/}"
  file="${file%.sh}"
  link "$dir/$location" "$HOME/$file"
done | column -s'>' -t -o'  >'


