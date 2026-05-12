local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 14
config.color_scheme = "Catppuccin Mocha"
config.term = "wezterm"

local f = io.open(wezterm.home_dir .. "/.local/state/last_cwd", "r")
if f then
  local cwd = f:read("*l")
  f:close()
  if cwd and cwd ~= "" then
    config.default_cwd = cwd
  end
end

config.keys = {
  {
    key = "k",
    mods = "SUPER",
    action = wezterm.action.SendString("\x1bk"),
  },
  {
    key = "Backspace",
    mods = "SUPER",
    action = wezterm.action.SendString("\x1b[3;9~"),
  },
  {
    key = "Enter",
    mods = "SUPER|SHIFT",
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = "w",
    mods = "SUPER",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "d",
    mods = "SUPER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "d",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "LeftArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x01"),
  },
  {
    key = "RightArrow",
    mods = "SUPER",
    action = wezterm.action.SendString("\x05"),
  },
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "SUPER",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
  },
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

return config
