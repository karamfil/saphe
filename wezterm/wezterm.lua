-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

-- config.color_scheme = 'Apple System Colors'
config.color_scheme = 'Argonaut (Gogh)'
config.font = wezterm.font("SauceCodePro Nerd Font Mono")
config.font_size = 11

config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 7

return config
