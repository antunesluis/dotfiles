-- Habilitar wrap de texto
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Spell checking
vim.opt_local.spell = true
vim.opt_local.spelllang = "en"

-- Indentação
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

-- Concealment (esconde sintaxe markdown)
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = ""

-- Keymaps minimalistas
local keymap = vim.keymap
local opts = { buffer = true, silent = true }

-- Toggle checkbox
keymap.set("n", "<leader>mc", function()
	local line = vim.api.nvim_get_current_line()
	local new_line

	if line:match("^%s*- %[ %]") then
		new_line = line:gsub("^(%s*- )%[ %]", "%1[x]")
	elseif line:match("^%s*- %[x%]") then
		new_line = line:gsub("^(%s*- )%[x%]", "%1[ ]")
	elseif line:match("^%s*-") then
		new_line = line:gsub("^(%s*- )", "%1[ ] ")
	else
		new_line = "- [ ] " .. line
	end

	vim.api.nvim_set_current_line(new_line)
end, { buffer = true, desc = "Toggle Markdown Checkbox" })

-- Headings rápidos
keymap.set("n", "<leader>m1", "I# <Esc>", { buffer = true, desc = "H1" })
keymap.set("n", "<leader>m2", "I## <Esc>", { buffer = true, desc = "H2" })
keymap.set("n", "<leader>m3", "I### <Esc>", { buffer = true, desc = "H3" })

-- Navegar entre headings
keymap.set("n", "]]", "/^#\\+\\s<CR>", opts)
keymap.set("n", "[[", "?^#\\+\\s<CR>", opts)
