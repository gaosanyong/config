local M = {}

local _detected

function M.detect()
  if _detected then
    return _detected
  end

  local term = vim.env.TERM or ""
  local tmux_term = ""
  if vim.env.TMUX then
    tmux_term = vim.fn.system("tmux display -p '#{client_termname}'"):gsub("%s+", "")
  end

  if term:match("kitty") or tmux_term:match("kitty") then
    _detected = "kitty"
  elseif term:match("alacritty") or tmux_term:match("alacritty") then
    _detected = "alacritty"
  elseif term:match("ghostty") or tmux_term:match("ghostty") then
    _detected = "ghostty"
  elseif term:match("WezTerm") or tmux_term:match("WezTerm") then
    _detected = "wezterm"
  else
    _detected = "default"
  end

  return _detected
end

return M
