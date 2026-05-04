return {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   config = function()
  --     local bg = "#011628"
  --     local bg_dark = "#011423"
  --     local bg_highlight = "#143652"
  --     local bg_search = "#0A64AC"
  --     local bg_visual = "#275378"
  --     local border = "#547998"
  --     local fg = "#CBE0F0"
  --     local fg_dark = "#B4D0E9"
  --     local fg_gutter = "#627E97"
  --
  --     require("tokyonight").setup({
  --       style = "night",
  --       on_colors = function(colors)
  --         colors.bg = bg
  --         colors.bg_dark = bg_dark
  --         colors.bg_float = bg_dark
  --         colors.bg_highlight = bg_highlight
  --         colors.bg_popup = bg_dark
  --         colors.bg_search = bg_search
  --         colors.bg_sidebar = bg_dark
  --         colors.bg_statusline = bg_dark
  --         colors.bg_visual = bg_visual
  --         colors.border = border
  --         colors.fg = fg
  --         colors.fg_dark = fg_dark
  --         colors.fg_float = fg
  --         colors.fg_gutter = fg_gutter
  --         colors.fg_sizebar = fg_dark
  --       end
  --     })
  --     vim.cmd("colorscheme tokyonight")
  --   end
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  dependencies = {
    "ellisonleao/gruvbox.nvim",
    "ishan9299/nvim-solarized-lua",
    "catppuccin/nvim",
  },
  config = function()
    local terminal = require("core.terminal").detect()

    if terminal == "kitty" then
      vim.o.background = "dark"
      vim.cmd.colorscheme("solarized")
    elseif terminal == "alacritty" then
      vim.o.background = "light"
      require("gruvbox").setup({
        italic = { strings = true, emphasis = true, comments = true },
      })
      vim.cmd.colorscheme("gruvbox")
    elseif terminal == "ghostty" then
      vim.o.background = "light"
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = true
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme("everforest")
    else
      vim.o.background = "dark"
      require("catppuccin").setup({ flavour = "mocha" })
      vim.cmd.colorscheme("catppuccin")
    end
  end,
}
