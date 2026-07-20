return {
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        -- dependencies = { "rafamadriz/friendly-snippets" },

        version = "1.*",
        opts = {
            keymap = {
                preset = "enter",
                -- Select completions
                ["<Up>"] = { "fallback" },
                ["<Down>"] = { "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-space>"] = { "show", "hide", "fallback" },
                -- Scroll documentation
                --["<S-Up>"] = { "scroll_documentation_up", "fallback" },
                --["<S-Down>"] = { "scroll_documentation_down", "fallback" },
                -- Show/hide signature
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                --default = { "snippets", "lsp", "path", "buffer" },
                default = function(ctx)
                    local success, node = pcall(vim.treesitter.get_node)
                    if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                        return { 'buffer' }
                    elseif vim.bo.filetype == 'markdown' then
                        return { 'buffer' }
                    else
                        return { 'snippets', 'lsp', 'path', 'buffer' }
                    end
                end,
                providers = { snippets = {
                    should_show_items = function(ctx) return ctx.trigger.initial_kind ~= 'trigger_character' end,
                    opts = { friendly_snippets = true },
                } },
            },
            fuzzy = {
                implementation = "prefer_rust",
                max_typos = 0,
                sorts = {
                    'exact',
                    'sort_text',
                    'score',
                    'kind',
                }
            },
            completion = {
                -- The keyword should only match against the text before
                keyword = { range = "full" },
                list = {
                    selection = { preselect = true, auto_insert = false }
                },
                ghost_text = { enabled = true },
                menu = {
                    auto_show = false,
                    -- Use treesitter to highlight the label text for the given list of sources
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                -- Show completions after typing a trigger character, defined by the source
                trigger = {
                    show_on_trigger_character = true
                },
                documentation = {
                    -- Show documentation automatically
                    auto_show = true,
                },
            },
            -- Signature help when typing
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    }
}
