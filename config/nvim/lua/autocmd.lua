local formatter_group = vim.api.nvim_create_augroup("Format auto commands", { clear = true })

function auto_fmt(pattern, desc, callback)
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        pattern = pattern,
        desc = "Auto-format " .. desc .. " files after saving",
        callback = function()
            vim.cmd(":silent !" .. callback(vim.api.nvim_buf_get_name(0)))
        end,
        group = formatter_group,
    })
end

auto_fmt({ "*.py" }, "Python", function(path) return "autopep8 -i " .. path end)
auto_fmt({ "*.zig", "*.zig.zon" }, "Zig", function(path) return "zig fmt " .. path end)
auto_fmt({ "*.hs" }, "Haskell", function(path) return "fourmolu " .. path .. " -i" end)
auto_fmt({ "*.ml", "*.mli" }, "OCaml", function(_) return "dune fmt" end)

local type_group = vim.api.nvim_create_augroup("FileType group", { clear = true })

function def_format(pattern, cmd)
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = pattern,
        callback = cmd,
        group = type_group,
    })
end

function small_indent() 
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
end

function small_tab() 
    small_ident()
    vim.opt.expandtab = false
end

-- tabs
def_format("markdown", function() vim.opt.expandtab = false end) -- for scdoc
def_format("html", small_tab)
def_format("css", small_tab)
-- 2 spaces
def_format("yaml", small_indent)
def_format("ocaml", small_indent)
