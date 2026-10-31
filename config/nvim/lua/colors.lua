vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function()
        vim.api.nvim_set_hl(0, "@property", {link = "Normal"})
        vim.api.nvim_set_hl(0, "@function.builtin", {link = "@function"})
        vim.api.nvim_set_hl(0, "goBlock", {link = "@punctuation"})
    end,
})
