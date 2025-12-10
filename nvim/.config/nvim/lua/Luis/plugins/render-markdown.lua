return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = { "markdown" },
		opts = {
			heading = {
				enabled = true,
				sign = false,
				-- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
				-- icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
				icons = {},
			},
			code = {
				enabled = true,
				sign = true,
				style = "full",
				position = "left",
				width = "block",
				left_pad = 0,
				right_pad = 0,
			},
			bullet = {
				enabled = true,
				icons = { "●", "○", "◆", "◇" },
			},
			checkbox = {
				enabled = true,
				unchecked = { icon = "󰄱 " },
				checked = { icon = "󰱒 " },
			},
			link = {
				enabled = true,
				image = "󰥶 ",
				hyperlink = "󰌹 ",
			},
		},
		keys = {
			{
				"<leader>mr",
				"<cmd>RenderMarkdown toggle<cr>",
				desc = "Toggle Markdown Rendering",
			},
		},
	},
}
