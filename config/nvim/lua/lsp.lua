vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())

-- highlight
local highlight_group = vim.api.nvim_create_augroup("UserLspHighlight", { clear = true })
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    group = highlight_group,
    callback = function() 
        if client.server_capabilities.documentHighlightProvider then
            vim.lsp.buf.document_highlight()
        end
    end
})
vim.api.nvim_create_autocmd({"CursorMoved"}, {
    callback = function() 
        if client.server_capabilities.documentHighlightProvider then
            vim.lsp.buf.clear_references()
        end
    end
})

-- inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end
})

-- configs
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
