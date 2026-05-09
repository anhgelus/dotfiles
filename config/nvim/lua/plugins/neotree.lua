return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
        close_if_last_window = true,
        enable_git_status = true,
        default_component_configs = {
            indent = {
                ident_size = 4,
                padding = 2 
            }
        },
        filesystem = {
            find_by_full_path_words = true,
        },
        nesting_rules = {
            ["js"] = { "js.map" },
            ["css"] = { "css.map" },
            ["packages.json"] = {
                pattern = "^package%.json$",
                files = { "package-lock.json", "yarn*", "bun.lock" }
            },
            ["go.mod"] = { "go.sum" },
            ["go"] = {
                pattern = "(.*)%.go$",    -- <-- Lua pattern with capture
                files = { "%1_test.go" }, -- <-- glob pattern with capture
            },
        },
        event_handlers = {
            {
                event = 'after_render',
                handler = function (state)
                    if not require('neo-tree.sources.common.preview').is_active() then
                        state.config = { use_float = true } -- or whatever your config is
                        state.commands.toggle_preview(state)
                    end
                end
            },
        },
        window = {
            mappings = {
                ["<cr>"] = "open",
                ["<Esc>"] = "cancel",
                ["<A-cr>"] = "open_vsplit",
                ["<t>"] = "open_tabnew",
                ["<r>"] = "rename",
                ["<d>"] = "delete",
                ["<S-Up>"] = { "scroll_preview", config = {direction = 2} },
                ["<S-Down>"] = { "scroll_preview", config = {direction = -2} },
            }
        }
    }
}
