vim.keymap.set('n', '<A-Left>', '<cmd>tabprevious<CR>')
vim.keymap.set('n', '<A-Right>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<A-q>', '<cmd>tabclose<CR>')

vim.keymap.set('n', '<C-t>t', '<cmd>tab terminal<CR>')
vim.keymap.set('n', '<C-t>v', '<cmd>vert terminal<CR>')
vim.keymap.set('n', '<C-t>h', '<cmd>hor terminal<CR>')
vim.keymap.set('t', '<C-W><Esc>', [[<C-\><C-N>]])

vim.keymap.set('n', '<C-W><A-Left>', '<C-W>h')
vim.keymap.set('n', '<C-W><A-Right>', '<C-W>l')
vim.keymap.set('n', '<C-W><A-Up>', '<C-W>j')
vim.keymap.set('n', '<C-W><A-Down>', '<C-W>k')

-- Neotree
vim.keymap.set('n', '<space>t', function() 
    require('neo-tree.command').execute({
        position = "float",
    })
end)
vim.keymap.set('n', '<space>f', function() 
    require('neo-tree.command').execute({
        source = "buffers",
        position = "float",
    })
end)
vim.keymap.set('n', '<space>g', function() 
    require('neo-tree.command').execute({
        source = "git_status",
        position = "float",
        reveal_force_cwd = true,
    })
end)

-- go to
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
-- display
vim.keymap.set('n', 'ss', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'sh', vim.lsp.buf.hover)
vim.keymap.set('n', 'sf', vim.diagnostic.open_float)
-- utils
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
vim.keymap.set('n', '<space><CR>', vim.lsp.buf.code_action)
