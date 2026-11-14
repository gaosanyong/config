-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map_run_cpp(buf)
  vim.keymap.set("n", "<leader>r", function()
    vim.cmd("write")
    -- Absolute paths so the binary isn't looked up on $PATH and spaces/quotes are safe
    local file = vim.fn.shellescape(vim.fn.expand("%:p"))
    local out = vim.fn.shellescape(vim.fn.expand("%:p:r"))
    local cmd = string.format("clang++ -std=c++20 %s -o %s && %s", file, out, out)

    -- Uses LazyVim's built-in snacks terminal
    if Snacks and Snacks.terminal then
      -- auto_close = false keeps the output visible after the program exits
      Snacks.terminal.open(cmd, { interactive = true, auto_close = false })
    else
      vim.cmd("split | terminal " .. cmd)
    end
  end, { buffer = buf, desc = "Run C++ in Terminal" })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function(event)
    map_run_cpp(event.buf)
  end,
})

-- This file loads on VeryLazy, after FileType already fired for the file nvim was started with
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_is_loaded(buf) and vim.tbl_contains({ "c", "cpp" }, vim.bo[buf].filetype) then
    map_run_cpp(buf)
  end
end

-- Type ;; in insert mode to put a semicolon at the end of the line
vim.keymap.set("i", ";;", "<Esc>A;", { desc = "Append semicolon to end of line" })
