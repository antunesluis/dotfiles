# AGENTS.md — Neovim Config

## Repo Overview
Personal Neovim configuration symlinked to `~/.config/nvim`. Lua-based, plugin-managed by **lazy.nvim**. Custom module namespace: `Luis`.

## Key Directories
- `init.lua` — entrypoint: loads `Luis.core` then `Luis.lazy`
- `lua/Luis/core/` — options + keymaps
- `lua/Luis/plugins/` — one file per plugin or plugin group
- `lua/Luis/plugins/lsp/` — LSP server configs + Mason
- `after/ftplugin/` — filetype-specific overrides (python, markdown, tsx)
- `lazy-lock.json` — pinned plugin versions; **commit after `:Lazy update`**

## Commands & Verification
There is no build/test/CI pipeline. Verification is opening Neovim and checking for errors:
```
nvim --headless "+Lazy! sync" +qa   # install/update plugins headlessly
nvim +qa                             # quick smoke test (exits if no startup errors)
```

## Architecture
- **Plugin manager**: lazy.nvim (auto-bootsraps on first run)
- **LSP**: nvim-lspconfig with `vim.lsp.config()` API (modern, not legacy `setup()`)
- **LSP servers** (via Mason): lua_ls, pyright, ts_ls, gopls, astro, tailwindcss, taplo, marksman, clangd, denols
- **Formatters** (Conform.nvim): prettier (js/ts/css/html/svelte/yaml/graphql/liquid), stylua (lua), black (python), biome (json), taplo (toml). **Format-on-save enabled** with 1000ms timeout, LSP fallback.
- **Linters** (nvim-lint): eslint_d (js/ts/svelte), ruff (python). Triggers on BufEnter, BufWritePost, InsertLeave.
- **Picker**: Snacks.nvim picker (telescope layout). Telescope still used for LSP references/definitions.
- **Completion**: nvim-cmp with LuaSnip, ghost text disabled, smart Tab/Shift-Tab
- **Default theme**: kanagawa (`lua/current-theme.lua`)
- **Leader key**: `<Space>`

## Indentation Conventions
- Default: 4 spaces, expandtab
- Python (ftplugin): 4 spaces
- TypeScript/TSX (ftplugin): 2 spaces
- Markdown (ftplugin): 2 spaces, wrap enabled, spell check (English)

## Key Facts
- Clipboard: `unnamedplus` (system clipboard)
- `Q` is disabled (noop)
- `Ctrl+c` works as ESC in both normal and insert mode
- mini.surround uses `sa`/`ds`/`sr` (not the default `S`)
- mini.comment integrated with ts-context-commentstring for JSX/TSX/Svelte
- eslint_d uses `--no-warn-ignored` flag
- gitsigns.nvim is **disabled** (commented out); Git operations go through Snacks LazyGit
- `lazydev.nvim` provides Lua LSP type hints for `vim` global

## Plugin Changes
- Add new plugins to `lua/Luis/plugins/` as a file returning a lazy spec table
- The `lua/Luis/plugins/init.lua` file is auto-imported as the module index
- LSP plugins go in `lua/Luis/plugins/lsp/`
- After adding a plugin with Mason-managed tools, run `:MasonToolsInstall` inside Neovim
