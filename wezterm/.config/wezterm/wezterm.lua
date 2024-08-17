-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Ayu Mirage (Gogh)'

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config