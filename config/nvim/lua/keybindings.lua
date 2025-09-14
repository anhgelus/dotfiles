vim.keymap.set('n', '<A-Right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<A-Left>', '<cmd>tabprevious<CR>')
-- Neotree
vim.keymap.set('n', '<A-&>', '<cmd>Neotree<CR>')
vim.api.nvim_create_user_command('Gs', 'Neotree float git_status git_base=main', {})
