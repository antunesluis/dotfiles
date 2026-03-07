return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

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
			automatic_enable = false,
			-- NOTE: apenas LSP servers
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"astro",
				"pyright",
				"taplo",
				"marksman", -- markdown LSP
				"clangd", -- C/C++ LSP
				"denols", -- Deno LSP
			},
		})

		mason_tool_installer.setup({
			-- NOTE: apenas formatters e linters
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				"ruff",
				"biome",
				"eslint_d",
				"taplo",
			},
		})
	end,
}
