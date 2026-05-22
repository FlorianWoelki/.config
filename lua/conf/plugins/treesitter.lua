return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "html",
                "css",
                "javascript",
                "typescript",
                "rust",
                "go",
                "lua",
                "vim",
                "vimdoc",
                "query"
            },

            sync_install = false,
            auto_install = true,

            autopairs = {
                enable = true,
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        })
    end
}
