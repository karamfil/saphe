current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing Starship Config'

ln -vfns "$current_dir/starship/starship.toml" "$HOME/.config/starship.toml"
