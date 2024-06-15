local M = {}

function M.setup(config)
  local wezterm = require 'wezterm'
  config.font = wezterm.font('FiraCode Nerd Font Mono')
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.tab_max_width = 64
  config.disable_default_key_bindings = true
  config.native_macos_fullscreen_mode = true
  config.adjust_window_size_when_changing_font_size = false
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }

  -- This is a workaround for https://github.com/wez/wezterm/issues/2669
  config.window_decorations = 'RESIZE | MACOS_FORCE_DISABLE_SHADOW'
  config.front_end = 'WebGpu'
  return config
end

return M
