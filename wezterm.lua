local wezterm = require('wezterm')
local config = {}

config.font = wezterm.font('FiraCode Nerd Font Mono')
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.disable_default_key_bindings = true
config.native_macos_fullscreen_mode = true
config.adjust_window_size_when_changing_font_size = false
config.keys = {
  {
    key = '-',
    mods = 'CMD',
    action = wezterm.action.DecreaseFontSize
  },
  {
    key = '=',
    mods = 'CMD',
    action = wezterm.action.IncreaseFontSize
  },
  {
    key = 'Enter',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen
  },
  {
    key = '\\',
    mods = 'CMD',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'DefaultDomain'
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  {
    key = 'RightArrow',
    mods = 'CMD | SHIFT',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'LeftArrow',
    mods = 'CMD | SHIFT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 's',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'h',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = 'l',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = 'j',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action.ReloadConfiguration
  },
}

for i = 1, 8 do
  -- CMD+number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Dark'
  else
    return 'Light'
  end
end

local dark_scheme = wezterm.color.get_builtin_schemes()['GruvboxDark']
local light_scheme = wezterm.color.get_builtin_schemes()['GruvboxLight']
dark_scheme.tab_bar = {
  background = "#1d2021",
  active_tab = {
    bg_color = "#282828",
    fg_color = "#fbf1c7",
  },
  inactive_tab = {
    bg_color = "#3c3836",
    fg_color = "#ebdbb2",
  },
  inactive_tab_hover = {
    bg_color = "#504945",
    fg_color = "#d5c4a1",
  },
  new_tab = {
    bg_color = "#1d2021",
    fg_color = "#ebdbb2",
  },
  new_tab_hover = {
    bg_color = "#504945",
    fg_color = "#d5c4a1",
  },
}
light_scheme.tab_bar = {
  background = "#f9f5d7",
  active_tab = {
    bg_color = "#fbf1c7",
    fg_color = "#282828",
  },
  inactive_tab = {
    bg_color = "#ebdbb2",
    fg_color = "#3c3836",
  },
  inactive_tab_hover = {
    bg_color = "#d5c4a1",
    fg_color = "#504945",
  },
  new_tab = {
    bg_color = "#f9f5d7",
    fg_color = "#282828",
  },
  new_tab_hover = {
    bg_color = "#d5c4a1",
    fg_color = "#504945",
  },
}

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

config.window_decorations = "RESIZE"
config.color_schemes = {
  ["Dark"] = dark_scheme,
  ["Light"] = light_scheme,
}
return config
