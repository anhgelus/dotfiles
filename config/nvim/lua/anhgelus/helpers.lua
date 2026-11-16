local M = {}

M.spell_check = function ()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "fr,en"
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 80
    vim.opt_local.colorcolumn = "80"
end

-- format

M.fmt = {}

M.fmt.small = function ()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
end

M.fmt.tab = function () vim.opt_local.expandtab = false end

M.fmt.small_tab = function ()
    M.fmt.small()
    M.fmt.tab()
end

M.fmt.extern = function (desc, callback)
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        desc = "Auto-format " .. desc .. " files after saving",
        callback = function()
            print("hello")
            vim.cmd("silent !" .. callback)
            vim.cmd.edit()
        end,
    })
end

return M
