return {
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
                pcall(vim.cmd, "colorscheme " .. "catppuccin-macchiato")
                -- darkest one: pcall(vim.cmd, "colorscheme " .. "catppuccin-mocha")
            end,
            set_light_mode = function()
                pcall(vim.cmd, "colorscheme " .. "catppuccin-latte")
            end,
        }
    }
}
