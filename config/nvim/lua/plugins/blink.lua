return {
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        -- dependencies = { "rafamadriz/friendly-snippets" },

        version = "*",
        opts = {
            keymap = {
                preset = "enter",
                -- Select completions
                ["<Up>"] = { "fallback" },
                ["<Down>"] = { "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<CR-space>"] = { "show", "hide", "fallback" },
                -- Scroll documentation
                ["<S-Up>"] = { "scroll_documentation_up", "fallback" },
                ["<S-Down>"] = { "scroll_documentation_down", "fallback" },
                -- Show/hide signature
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { 
                implementation = "prefer_rust_with_warning",
                max_typos = function(keyword) return math.floor(#keyword / 8) end,
                sorts = {
                    -- kind priority:
                    -- 1. keyword
                    -- 2. variable
                    -- 3. methods
                    -- 4. function
                    function(a, b)
                        local index = function(t, v)
                            for index, value in ipairs(t) do
                                if value == v then return index end
                            end
                            return 100 -- using 100 because it is unlikely that I have more than 100 priorities
                        end
                        local kind = require('blink.cmp.types').CompletionItemKind
                        local priority = { kind.Keyword, kind.Variable, kind.Method, kind.Function }
                        local aIn = index(priority, a)
                        local bIn = index(priority, b)
                        if aIn ~= bIn then
                            return aIn > bIn
                        end
                    end,
                    'score',
                    'sort_text'
                }
            },
            completion = {
                -- The keyword should only match against the text before
                keyword = { range = "prefix" },
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

            -- Signature help when tying
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    }
}
