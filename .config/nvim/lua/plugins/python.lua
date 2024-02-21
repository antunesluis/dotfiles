return {
  -- Add `pyright` to mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "pyright", "black" })
    end,
  },

  -- Setup null-ls with `black`
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, { nls.builtins.formatting.black })
    end,
  },

  -- Add `server` and setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        -- pyright = {},
        ruff_lsp = {
          -- handlers = {
          --   ["textDocument/publishDiagnostics"] = function() end,
          -- },
        },
        jedi_language_server = {},
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        pyright = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "pyright" then
              -- disable hover in favor of jedi-language-server
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Setup up format with new `conform.nvim`
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { { "black", "ruff" } },
      },
    },
  },
}
