current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing Alfred Config'
echo '> you need to set the preference folder in Alfred Preferences > Advanced > Syncing'

rm -rf "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/preferences"
rm -rf "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows"

ln -vfns "$current_dir/alfred/Alfred.alfredpreferences/preferences" "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/preferences"
ln -vfns "$current_dir/alfred/Alfred.alfredpreferences/workflows" "$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows"