local wezterm = require 'wezterm'
local act = wezterm.action
local scroll_strength = 5

return {
  default_prog = { 'nu' },
  prefer_egl = true,
  color_scheme = 'midnight-in-mojave',
  colors = {
    cursor_bg = '#ffbdf6',
  },
  font = wezterm.font('JetBrains Mono', { weight = 'Medium'}),
  font_size = 11.0,
  enable_scroll_bar = true,
  keys = {
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = act.CloseCurrentPane { confirm = false },
    },
    {
      key = 'DownArrow',
      mods = 'CTRL|SHIFT',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- Change Split Focus
    {
      key = 'j',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = 'k',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'h',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'ALT',
      action = act.ActivatePaneDirection 'Right',
    },
    -- scrolling
    {
      key = 'j',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByLine(scroll_strength),
    },
    {
      key = 'k',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByLine(-scroll_strength),
    },
    {
      key = 'f',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByPage(1),
    },
    {
      key = 'b',
      mods = 'CTRL|SHIFT',
      action = act.ScrollByPage(-1)
    },
    -- search
    {
      key = '/',
      mods = 'CTRL',
      action = act.Search("CurrentSelectionOrEmptyString")
    },
    -- spawn WSL tab
    {
      key = '@',
      mods = 'CTRL|SHIFT',
      action = act.SpawnTab { DomainName = 'WSL:Arch'}
    },
    -- spawn PS tab
    {
      key = '!',
      mods = 'CTRL|SHIFT',
      action = act.SpawnCommandInNewTab { args = {'pwsh'}}
    },
    -- spawn CMD tab
    {
      key = '#',
      mods = 'CTRL|SHIFT',
      action = act.SpawnCommandInNewTab { args = {'cmd'}}
    },
    -- spawn nushell tab
    {
      key = '$',
      mods = 'CTRL|SHIFT',
      action = act.SpawnCommandInNewTab { args = {'nu'}}
    },
  }
}
