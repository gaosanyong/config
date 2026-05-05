return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*", 
  opts = function()
    return {
      options = {
        mode = "tabs",
        separator_style = "thin",
        style_preset = require("bufferline").style_preset.minimal,
        name_formatter = function(buf)
          local tabid = buf.tabnr
          if not tabid then
            return buf.name
          end
          for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
            local bufid = vim.api.nvim_win_get_buf(winid)
            local name = vim.api.nvim_buf_get_name(bufid)
            local ft = vim.bo[bufid].filetype
            if ft ~= "NvimTree" and name ~= "" then
              return vim.fn.fnamemodify(name, ":t")
            end
          end
          return buf.name
        end,
      },
    }
  end,
}
