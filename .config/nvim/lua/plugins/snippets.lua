return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "mlaursen/vim-react-snippets",
    "rafamadriz/friendly-snippets", -- Adiciona mais snippets
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local compare = cmp.config.compare

    -- Carregar snippets do friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Configurar tipos de snippets suportados
    luasnip.config.setup({
      history = true, -- Permite navegação entre placeholders
      updateevents = "TextChanged,TextChangedI", -- Atualiza snippets dinamicamente
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = {
            virt_text = { { "●", "GruvboxOrange" } },
          },
        },
      },
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip", priority = 1000, max_item_count = 5 },
        { name = "nvim_lsp", priority = 750, max_item_count = 20 },
        {
          name = "buffer",
          priority = 500,
          max_item_count = 5,
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "path", priority = 250 },
      }),
      sorting = {
        priority_weight = 2.0,
        comparators = {
          compare.score,
          compare.locality,
          compare.recently_used,
          compare.offset,
          compare.exact,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },
      formatting = {
        format = function(entry, vim_item)
          -- Adiciona ícones aos tipos de completion
          local kind = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
          })(entry, vim_item)

          -- Adiciona a fonte da sugestão
          local source = ({
            luasnip = "[Snip]",
            nvim_lsp = "[LSP]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]

          vim_item.menu = source
          return vim_item
        end,
      },
    })
  end,
}
