vim.keymap.set('n', '<A-Right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<A-Left>', '<cmd>tabprevious<CR>')

-- Neotree
vim.keymap.set('n', '<A-&>', '<cmd>Neotree<CR>')
--vim.api.nvim_create_user_command('Gs', 'Neotree float git_status git_base=main', {})

-- LSP
-- go to
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
-- display
vim.keymap.set('n', 'ds', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'dh', vim.lsp.buf.hover)
-- utils
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
vim.keymap.set('n', '<space><CR>', vim.lsp.buf.code_action)
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    callback = vim.lsp.buf.document_highlight
})
vim.api.nvim_create_autocmd({"CursorMoved"}, {
    callback = vim.lsp.buf.clear_references
})
