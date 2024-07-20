return -- Gruvbox
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
}
