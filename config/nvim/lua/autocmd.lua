vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    callback = vim.lsp.buf.document_highlight
})
vim.api.nvim_create_autocmd({"CursorMoved"}, {
    callback = vim.lsp.buf.clear_references
})

-- format
local formatter_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Auto-format Python files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !autopep8 -i " .. fileName)
    end,
    group = formatter_group,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.zig", "*.zig.zon" },
    desc = "Auto-format Zig files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !zig fmt " .. fileName)
    end,
    group = formatter_group,
})
