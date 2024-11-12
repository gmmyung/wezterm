local wezterm = require('wezterm')
local config = wezterm.config_builder()

config = require('misc').setup(config)
config = require('keymap').setup(config)
config = require('color_scheme').setup(config)
config = require('ssh').setup(config)
return config
