vim.keymap.set('n', '<A-Right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<A-Left>', '<cmd>tabprevious<CR>')
-- Neotree
vim.keymap.set('n', '<A-&>', '<cmd>Neotree<CR>')
vim.api.nvim_create_user_command('Gs', 'Neotree float git_status git_base=main', {})
-- LSP
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
vim.keymap.set('n', '<F6>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
