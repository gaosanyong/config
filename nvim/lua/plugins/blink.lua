return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default", -- Uses Ctrl+y to accept instead of Enter
      ["<CR>"] = { "fallback" }, -- Forces Enter to just insert a newline
    },
  },
}
