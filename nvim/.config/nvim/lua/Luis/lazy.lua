local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "Luis.plugins" },
    { import = "Luis.plugins.lsp" },
  },
  -- Sem checagem automática: as versões vêm do lazy-lock.json versionado, e
  -- atualizar é um :Lazy update deliberado.
  checker = { enabled = false },
  -- Nenhum plugin daqui precisa de luarocks, e o luarocks não está instalado.
  rocks = { enabled = false },
})
