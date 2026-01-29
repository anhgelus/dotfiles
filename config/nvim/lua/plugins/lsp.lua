return {
    {
		"neovim/nvim-lspconfig",
		config = function()
			-- local lspconfig = require("lspconfig")

			-- lspconfig.pylsp.setup({})
		end,
	},
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { 
                -- python
                "ty",
                -- elixir
                "elixirls",
                -- go
                "gopls",
                -- typst
                "tinymist",
                -- C
                "clangd",
                -- zig
                "zls",
                -- clojure
                "clojure_lsp",
                -- web
                "cssls", "emmet_ls", "html",
                -- containers
                "dockerls"
            },
        },
    },
}
