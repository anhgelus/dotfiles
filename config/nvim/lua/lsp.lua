vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())

local highlight_group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = true })
local fmt_grp = vim.api.nvim_create_augroup("UserLspFormat", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method("textDocument/documentHighlightProvider") then
            vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
                group = highlight_group,
                callback = vim.lsp.buf.document_highlight
            })
            vim.api.nvim_create_autocmd({"CursorMoved"}, {
                group = highlight_group,
                callback = vim.lsp.buf.clear_references
            })
        end
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = fmt_grp,
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
        if client:supports_method("textDocument/inlayHintProvider") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end
})

-- specific configs
vim.lsp.config("ty", {
    settings = {
        ty = {
            inlayHints = {
                variableTypes = true,
                callArgumentNames = true,
            },
        },
    },
})
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                ignoredError = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            completeUnimported = true,
        },
    },
})
vim.lsp.config("zls", {
    settings = {
        zls = {
            --enable_inlay_hints = true,
            inlay_hints_show_builtin = true,
            inlay_hints_show_parameter_name = true,
            inlay_hints_show_variable_type_hints = true,
            inlay_hints_show_struct_literal_field_type = true,
            inlay_hints_exclude_single_argument = true,
            inlay_hints_hide_redundant_param_names = false,
            inlay_hints_hide_redundant_param_names_last_token = false,
        },
    },
})
vim.lsp.config("hls", {
    settings = {
        hls = {
            plugins = { semanticTokens = { globalOn = true } }
        }
    }
})
