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
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Configurações específicas para tipos de arquivo
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- Configurações específicas para versões mais recentes do Neovim
if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- Configurações do Prettier
vim.g.lazyvim_prettier_needs_config = true

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Adiciona suporte a novos tipos de arquivos
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

-- Configurações específicas para tipos de arquivo
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
