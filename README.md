# Notes

install using the install script

```sh
./install.sh
```

## Add new Home config example

```sh
mkdir wezterm
touch wezterm/wezterm.lua
cd _home
ln -s ../wezterm/wezterm.lua wezterm.lua
cd ..
./install.sh
```
