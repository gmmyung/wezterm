local M = {}

function M.setup(config)
  local act = require 'wezterm'.action

  local keys = {
    {
      key = '-',
      mods = 'CMD',
      action = act.DecreaseFontSize
    },
    {
      key = '=',
      mods = 'CMD',
      action = act.IncreaseFontSize
    },
    {
      key = 'Enter',
      mods = 'CMD',
      action = act.ToggleFullScreen
    },
    {
      key = '\\',
      mods = 'CMD',
      action = act.ShowDebugOverlay
    },
    {
      key = 't',
      mods = 'CMD',
      action = act.SpawnTab 'DefaultDomain'
    },
    {
      key = 'w',
      mods = 'CMD',
      action = act.CloseCurrentTab { confirm = true }
    },
    {
      key = 'RightArrow',
      mods = 'CMD | SHIFT',
      action = act.ActivateTabRelative(1)
    },
    {
      key = 'LeftArrow',
      mods = 'CMD | SHIFT',
      action = act.ActivateTabRelative(-1)
    },
    {
      key = 's',
      mods = 'CMD | SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      key = 'v',
      mods = 'CMD | SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      key = 'h',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Left'
    },
    {
      key = 'l',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Right'
    },
    {
      key = 'k',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Up'
    },
    {
      key = 'j',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Down'
    },
    {
      key = 'r',
      mods = 'CMD',
      action = act.ReloadConfiguration
    },
    {
      key = 'q',
      mods = 'CMD',
      action = act.QuitApplication
    },
    {
      key = 'v',
      mods = 'CMD',
      action = act.PasteFrom 'Clipboard',
    },
    {
      key = 'c',
      mods = 'CMD',
      action = act.CopyTo 'Clipboard',
    },
  }

  for i = 1, 8 do
    -- CMD+number to move to that position
    table.insert(keys, {
      key = tostring(i),
      mods = 'CMD',
      action = act.ActivateTab(i - 1),
    })
  end

  config.keys = keys

  -- This solves macos mission control lag temporarily
  -- https://github.com/wez/wezterm/issues/2669
  config.send_composed_key_when_right_alt_is_pressed = false
  return config
end

return M
