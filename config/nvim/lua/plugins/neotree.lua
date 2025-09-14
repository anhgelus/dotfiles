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
        window = {
            mappings = {
                ["<cr>"] = "open",
                ["esc"] = "cancel",
                ["<A-cr>"] = "open_tabnew",
                ["<r>"] = "rename",
                ["<d>"] = "delete"
            }
        }
    }
}
