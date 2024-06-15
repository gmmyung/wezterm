local M = {}

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Dark'
  else
    return 'Light'
  end
end


function M.setup(config)
  local wezterm = require 'wezterm'
  local color = wezterm.color
  local dark_scheme = color.get_builtin_schemes()['GruvboxDark']
  local light_scheme = color.get_builtin_schemes()['GruvboxLight']
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

  config.color_schemes = {
    ["Dark"] = dark_scheme,
    ["Light"] = light_scheme,
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

  return config
end

return M
