current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing Neovim Config'

ln -vfns "$current_dir/nvim" "$HOME/.config/nvim"

