return {
    {
        "SirVer/ultisnips",
        init = function()
            -- vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
            vim.g.UltiSnipsExpandTrigger = '<C-a>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
        end,
    }
}
