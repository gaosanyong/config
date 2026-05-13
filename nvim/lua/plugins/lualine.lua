return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    local terminal = require("core.terminal").detect()

    local sec_sep = { left = "", right = "" }
    local comp_sep = { left = "", right = "" }
    if terminal == "ghostty" then
      sec_sep = { left = "", right = "" }
      comp_sep = { left = "", right = "" }
    elseif terminal == "kitty" then
      sec_sep = { left = "▌", right = "▐" }
      comp_sep = { left = "▌", right = "▐" }
    elseif terminal == "alacritty" then
      sec_sep = { left = "", right = "" }
      comp_sep = { left = "", right = "" }
    elseif terminal == "wezterm" then
      sec_sep = { left = "", right = "" }
      comp_sep = { left = "", right = "" }
    end

    lualine.setup({
      options = {
        theme = "auto",
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
