return {
    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = {
                char = "▏",
            },
        },
    },

    -- messages, cmdline and the popupmenu
    {
        "folke/noice.nvim",
        event = "VeryLazy",

        opts = {
            lsp = {
                progress = {
                    enabled = false,
                },

                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = true,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ["cmp.entry.get_documentation"] = true,
                },
                message = {
                    enabled = true, -- Messages shown by lsp servers
                },
            },

            health = {
                checker = false, -- Disable if you don't want health checks to run
            },

            presets = {
                -- you can enable a preset by setting it to true, or a table that will override the preset config
                -- you can also add custom presets that you can enable/disable with enabled=true
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },

            insert = {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
            },
        },
    },

    {
        "rcarriga/nvim-notify",
        lazy = true,
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Clear notifications",
            },
        },
        opts = { timeout = 1200 },
    },

    -- buffer line
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
        },
        opts = {
            options = {
                mode = "tabs",
                -- separator_style = "slant",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },

    -- filename
    {
        "b0o/incline.nvim",
        priority = 1200,
        config = function()
            require("incline").setup({
                window = { margin = { vertical = 0, horizontal = 1 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },

    -- animations
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.scroll = {
                enable = false,
            }
        end,
    },

    --hardtime
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {
            allow_different_key = true,
            hints = {
                ["[dcyvV][ia][%(%)]"] = {
                    message = function(keys)
                        return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
                    end,
                    length = 3,
                },
            },
        },
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            local logo = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]]
            logo = string.rep("\n", 7) .. logo .. "\n\n"
            opts.config.header = vim.split(logo, "\n")
        end,
    },
}
