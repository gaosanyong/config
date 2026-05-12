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
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

return config
