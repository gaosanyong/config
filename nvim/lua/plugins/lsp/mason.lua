return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
      ensure_installed = {
        "clangd", -- c++ lsp
        "golangci_lint_ls", -- go lsp
        "lua_ls", -- lua lsp
        "pyright", -- python lsp
        "rust_analyzer", -- rust lsp
        "ts_ls", -- typescript lsp
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format", -- c/cpp formatter
        "goimports", -- go formatter
        "rustfmt", -- rust formatter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter

        "shellcheck", -- bash linter
        "cpplint", -- c/cpp linter
        "golangci-lint", -- go linter
        "jsonlint", -- json linter
        "checkstyle", -- java linter
        "eslint_d", -- javascript/typescript linter
        "pylint", -- python linter
      },
    })
  end,
}
