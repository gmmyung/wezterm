local wezterm = require('wezterm')
local config = {}

config = require('misc').setup(config)
config = require('keymap').setup(config)
config = require('color_scheme').setup(config)
return config
