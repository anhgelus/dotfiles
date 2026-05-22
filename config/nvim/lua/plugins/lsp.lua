return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = { 
                -- python
                "ty",
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
                -- sql
                -- "sqlfluff"
            },
        },
    },
}
