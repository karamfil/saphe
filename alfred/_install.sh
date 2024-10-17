current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing Alfred Config'

ln -vfns "$current_dir/alfred/Alfred.alfredpreferences/preferences" "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/preferences"
ln -vfns "$current_dir/alfred/Alfred.alfredpreferences/workflows" "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows"