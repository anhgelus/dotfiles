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
                        return { 'buffer', 'path' }
                    else
                        return { 'lsp', 'snippets', 'path', 'buffer' }
                    end
                end,
                per_filetype = {
                    markdown = { inherit_defaults = false, 'snippets', 'write_buffer', 'lsp', 'path' },
                    typst = { inherit_defaults = false, 'snippets', 'write_buffer', 'lsp', 'path' },
                },
                providers = {
                    snippets = {
                        should_show_items = function(ctx) return ctx.trigger.initial_kind ~= 'trigger_character' end,
                        opts = { friendly_snippets = true },
                    },
                    write_buffer = {
                        module = 'blink.cmp.sources.buffer',
                        score_offset = -3,
                        transform_items = function (a, items)
                            local keyword = a.get_keyword()
                            local correct, case
                            if keyword:match('^%l') then
                                correct = '^%u%l+$'
                                case = string.lower
                            elseif keyword:match('^%u') then
                                correct = '^%l+$'
                                case = string.upper
                            else
                                return items
                            end

                            -- avoid duplicates from the corrections
                            local seen = {}
                            local out = {}
                            for _, item in ipairs(items) do
                                local raw = item.insertText
                                if raw:match(correct) then
                                    local text = case(raw:sub(1,1)) .. raw:sub(2)
                                    item.insertText = text
                                    item.label = text
                                end
                                if not seen[item.insertText] then
                                    seen[item.insertText] = true
                                    table.insert(out, item)
                                end
                            end
                            return out
                        end
                    },
                },
            },
            fuzzy = {
                implementation = "prefer_rust",
                max_typos = 0,
                sorts = {
                    'score',
                    'sort_text',
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
