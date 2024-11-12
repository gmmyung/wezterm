local M = {}

function M.setup(config)
	local wezterm = require 'wezterm'
	config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font Mono', 'Apple Color Emoji' }
	config.unicode_version = 9
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 64
	config.tab_bar_at_bottom = true
	config.disable_default_key_bindings = true
	config.native_macos_fullscreen_mode = true
	config.hide_mouse_cursor_when_typing = true
	config.adjust_window_size_when_changing_font_size = false
	config.window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	}

	config.window_decorations = 'RESIZE'
	-- https://github.com/wez/wezterm/issues/1872
	-- mux is very slow, so using this
	-- config.default_mux_server_domain = 'unix'
	config.front_end = 'WebGpu'
	return config
end

return M
