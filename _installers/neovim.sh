current_dir=$(dirname $(dirname $(greadlink -f "$0")))

echo
echo '# Installing vim + deps'

rm -rf "$HOME/.vim"
ln -vfns "$current_dir/vim/janus/janus/vim" "$HOME/.vim"
ln -vfns "$current_dir/vim/vimrc.before" "$HOME/.vimrc.before"
ln -vfns "$current_dir/vim/vimrc.after" "$HOME/.vimrc.after"
ln -vfns "$current_dir/vim/janus-custom" "$HOME/.janus"
ln -vfns "$HOME/.vim/vimrc" "$HOME/.vimrc"

# set all vi/vim to nvim
# ln -vfns "/opt/homebrew/bin/nvim" "/usr/local/bin/vi"
# ln -vfns "/opt/homebrew/bin/nvim" "/usr/local/bin/vim"
# ln -vfns "/opt/homebrew/bin/nvim" "/usr/local/bin/vimdiff"
# ln -vfns "/opt/homebrew/bin/nvim" "/usr/local/bin/view"
