return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local terminal = require("core.terminal").detect()

    local lualine_theme = "catppuccin"
    if terminal == "kitty" then
      lualine_theme = "solarized_dark"
    elseif terminal == "alacritty" then
      lualine_theme = "gruvbox_light"
    elseif terminal == "ghostty" then
      lualine_theme = "everforest"
    end

    local sec_sep = { left = "", right = "" }
    local comp_sep = { left = "", right = "" }
    if terminal == "ghostty" then
      sec_sep = { left = "", right = "" }
      comp_sep = { left = "", right = "" }
    elseif terminal == "kitty" then
      sec_sep = { left = "▌", right = "▐" }
      comp_sep = { left = "▌", right = "▐" }
    elseif terminal == "alacritty" then
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
