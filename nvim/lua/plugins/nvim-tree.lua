return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set("n", "t", function()
          local node = api.tree.get_node_under_cursor()
          if not node or node.type == "directory" then
            return
          end
          local filepath = node.absolute_path
          for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
            for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
              local bufid = vim.api.nvim_win_get_buf(winid)
              if vim.api.nvim_buf_get_name(bufid) == filepath then
                vim.api.nvim_set_current_tabpage(tabid)
                vim.api.nvim_set_current_win(winid)
                return
              end
            end
          end
          vim.cmd("tabnew " .. vim.fn.fnameescape(filepath))
          api.tree.open()
          api.tree.find_file(filepath)
          vim.cmd("wincmd l")
        end, { buffer = bufnr, desc = "Open in new tab (reuse existing)" })
      end,
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    vim.api.nvim_create_user_command("Q", function()
      local wins = vim.api.nvim_tabpage_list_wins(0)
      local has_tree = false
      local non_tree = 0
      for _, w in ipairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(w)].filetype == "NvimTree" then
          has_tree = true
        else
          non_tree = non_tree + 1
        end
      end
      if has_tree and non_tree <= 1 then
        if #vim.api.nvim_list_tabpages() > 1 then
          vim.cmd("tabclose")
        else
          vim.cmd("qall")
        end
      else
        vim.cmd("q")
      end
    end, {})
    vim.cmd("cabbrev q Q")

    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end
}

