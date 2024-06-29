-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd(
  [[
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal spelllang=pt_br
]],
  false
)
