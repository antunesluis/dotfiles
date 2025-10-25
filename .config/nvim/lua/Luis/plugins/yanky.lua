return {
	"gbprod/yanky.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 500,
		},
		ring = {
			history_length = 100,
			storage = "shada",
			sync_with_numbered_registers = true,
		},
		system_clipboard = {
			sync_with_ring = true,
		},
	},
	dependencies = { "folke/snacks.nvim" },
	keys = {
		{
			"<leader>p",
			function()
				require("snacks").picker.yanky() -- CorreÃ§Ã£o aqui
			end,
			mode = { "n", "x" },
			desc = "Open Yank History",
		},
	},
}
