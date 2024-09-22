return -- Gruvbox
{
    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_intend_guides = false,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = true,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
        opts = ...,
    },

    -- Solarized-Osaka
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("solarized-osaka").setup({
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    sidebars = "dark",
                    floats = "dark",
                },
                sidebars = { "qf", "help" },
                day_brightness = 0.3,
                hide_inactive_statusline = false,
                dim_inactive = false,
                lualine_bold = false,

                on_colors = function(colors) end,

                on_highlights = function(highlights, colors)
                    highlights.TelescopeNormal = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                    highlights.TelescopeBorder = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
                    highlights.TelescopePromptNormal = {
                        bg = colors.bg_dark,
                    }
                    highlights.TelescopePromptBorder = {
                        bg = colors.bg_dark,
                        fg = colors.bg_dark,
                    }
                    highlights.TelescopePromptTitle = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                    highlights.TelescopePreviewTitle = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                    highlights.TelescopeResultsTitle = {
                        bg = colors.bg_dark,
                        fg = colors.fg_dark,
                    }
                end,
            })
        end,
    },
}
