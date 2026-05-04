return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local term = vim.env.TERM or ""
    local tmux_term = ""
    if vim.env.TMUX then
      tmux_term = vim.fn.system("tmux display -p '#{client_termname}'"):gsub("%s+", "")
    end
    local is_alacritty = term:match("alacritty") or tmux_term:match("alacritty")
    local is_kitty = term:match("kitty") or tmux_term:match("kitty")

    local lualine_theme = "everforest"
    if is_kitty then
      lualine_theme = "solarized_dark"
    elseif is_alacritty then
      lualine_theme = "gruvbox_light"
    end

    local sec_sep = { left = "", right = "" }
    local comp_sep = { left = "", right = "" }
    if is_kitty then
      sec_sep = { left = "▌", right = "▐" }
      comp_sep = { left = "▌", right = "▐" }
    elseif is_alacritty then
      sec_sep = { left = "", right = "" }
      comp_sep = { left = "", right = "" }
    end

    lualine.setup({
      options = {
        theme = lualine_theme,
        section_separators = sec_sep,
        component_separators = comp_sep,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#DFA000" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}

