return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<M-l>", -- Alt+l aceita tudo
						accept_word = "<M-w>", -- Alt+w aceita uma palavra
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false }, -- desativa painel nativo
				filetypes = {
					markdown = true,
					help = false,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		config = function()
			local chat = require("CopilotChat")

			chat.setup({
				window = {
					layout = "vertical",
					width = 0.4,
				},
				mappings = {
					reset = {
						normal = "<C-r>",
						insert = "<C-r>",
					},
					submit_prompt = {
						normal = "<CR>",
						insert = "<C-s>",
					},
				},
				headers = {
					user = "  You",
					assistant = "  Copilot ",
					tool = "󰊳  Tool ",
				},
				auto_insert_mode = true,
			})

			-- Abre o chat (contexto do buffer atual)
			vim.keymap.set("n", "<leader>cc", function()
				chat.open({ window = { layout = "vertical" } })
			end, { desc = "Copilot Chat: abrir" })

			-- Explica seleção visual
			vim.keymap.set("v", "<leader>ce", function()
				chat.open({
					window = { layout = "vertical" },
					prompt = "/Explain",
				})
			end, { desc = "Copilot Chat: explicar seleção" })

			-- Refatora seleção visual
			vim.keymap.set("v", "<leader>cr", function()
				chat.open({
					window = { layout = "vertical" },
					prompt = "/Refactor",
				})
			end, { desc = "Copilot Chat: refatorar seleção" })

			-- Fix seleção visual
			vim.keymap.set("v", "<leader>cf", function()
				chat.open({
					window = { layout = "vertical" },
					prompt = "/Fix",
				})
			end, { desc = "Copilot Chat: fix seleção" })
		end,
	},
}
