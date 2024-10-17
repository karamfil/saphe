current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing home files'

# todo maybe move this to be ZSH only
# install *sh files in home directory
for location in $(find _home -type l -name '*'); do
	file="${location##*/}"
	file="${file%.sh}"
	
	ln -vfns "$current_dir/$location" "$HOME/.$file"
done | column -s'->' -t
