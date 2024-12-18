-- Configurações básicas
vim.g.mapleader = " "
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = ""

-- Aparência
vim.opt.number = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.wrap = false -- No Wrap lines
vim.opt.conceallevel = 2

-- Indentação e espaçamento
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Busca
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.inccommand = "split"

-- Edição
vim.opt.backup = false
vim.opt.breakindent = true
vim.opt.backspace = { "start", "eol", "indent" }

-- Janelas e divisões
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"

-- Busca de arquivos
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders

-- Formatação
vim.opt.formatoptions:append({ "r" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])

-- Configurações específicas para tipos de arquivo
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

vim.filetype.add({
  extension = {
    js = "javascript",
    jsx = "javascriptreact",
    ts = "typescript",
    tsx = "typescriptreact",
  },
  filename = {
    [".eslintrc"] = "json",
    [".prettierrc"] = "json",
  },
  pattern = {
    [".*%.js"] = "javascript",
    [".*%.jsx"] = "javascriptreact",
    [".*%.ts"] = "typescript",
    [".*%.tsx"] = "typescriptreact",
  },
})

-- HTML: 2 espaços para indentação
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html",
    "css",
    "ejs",
    "vue",
    "jsx",
    "tsx",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Configurações do Obsidian
local obsidian_mappings = {
  { "n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>", "Obsidian Check Checkbox" },
  { "n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", "Insert Obsidian Template" },
  { "n", "<leader>oo", "<cmd>ObsidianOpen<CR>", "Open in Obsidian App" },
  { "n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", "Show ObsidianBacklinks" },
  { "n", "<leader>ol", "<cmd>ObsidianLinks<CR>", "Show ObsidianLinks" },
  { "n", "<leader>on", "<cmd>ObsidianNew<CR>", "Create New Note" },
  { "n", "<leader>os", "<cmd>ObsidianSearch<CR>", "Search Obsidian" },
  { "n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", "Quick Switch" },
}

for _, mapping in ipairs(obsidian_mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], { desc = mapping[4] })
end

-- Configurações específicas para versões mais recentes do Neovim
if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- Configuração específica para arquivos Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Quebra de linha
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- Quebra linhas em palavras completas
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions = "tcqjn"
    -- t: quebra automática de texto
    -- c: quebra automática de comentários
    -- q: permite formatar comentários com "gq"
    -- j: remove comentário líder ao juntar linhas
    -- n: reconhece listas numeradas

    -- Correção ortográfica
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "pt_br,en_us"

    -- Destaque de sintaxe aprimorado
    vim.opt_local.conceallevel = 2

    -- Indentação
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true

    -- Folding (dobradura de código)
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldenable = false -- Começa com todas as dobras abertas

    -- Navegação melhorada
    vim.opt_local.suffixesadd:append(".md")
    vim.opt_local.path:append("**")

    -- Completação automática de listas
    vim.opt_local.comments = "b:*,b:-,b:+,n:>"

    -- Mapeamentos específicos para Markdown
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { buffer = true, desc = "Markdown Preview" })
    vim.keymap.set("n", "<leader>mt", ":TableModeToggle<CR>", { buffer = true, desc = "Toggle Table Mode" })

    -- Comando para reformatar parágrafos
    vim.api.nvim_buf_create_user_command(0, "WrapParagraph", function()
      vim.cmd("normal! gqip")
    end, { desc = "Wrap current paragraph" })

    vim.keymap.set("n", "<leader>mw", ":WrapParagraph<CR>", { buffer = true, desc = "Wrap Paragraph" })
  end,
})

vim.keymap.set("n", "<S-l>", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Configurações do Prettier
vim.g.lazyvim_prettier_needs_config = false

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
