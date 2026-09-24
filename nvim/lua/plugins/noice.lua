return {
  -- Neovim 0.12 emits `:!cmd` output as `msg_show` events with the kinds
  -- `shell_cmd` / `shell_out` / `shell_err` / `shell_ret`. Noice consumes every
  -- `msg_show` event (it returns `true` from its `vim.ui_attach` callback), but
  -- its default route only displays the kinds
  -- `{ "", "echo", "echomsg", "lua_print", "list_cmd" }` -- so shell output is
  -- swallowed and never rendered anywhere. Route it explicitly.
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        view = "popup",
        filter = {
          event = "msg_show",
          kind = { "shell_cmd", "shell_out", "shell_err", "shell_ret" },
        },
        opts = { title = "Shell", merge = true, replace = true },
      })
    end,
  },
}
