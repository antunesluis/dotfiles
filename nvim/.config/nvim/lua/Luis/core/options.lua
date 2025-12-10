-- Disable netrw banner
vim.g.netrw_banner = 0

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Backup and undo
-- vim.opt.swapfile = false
-- vim.opt.backup = false

-- Search
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Backspace behavior
vim.opt.backspace = { "start", "eol", "indent" }

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Performance
vim.opt.updatetime = 250

-- Mouse
vim.opt.mouse = "a"

-- File handling
vim.opt.isfname:append("@-@")

-- EditorConfig support
vim.g.editorconfig = true
