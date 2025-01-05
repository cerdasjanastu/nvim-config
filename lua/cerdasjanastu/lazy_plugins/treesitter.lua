return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "lua",
                "python",
                "json",
                "xml",
                "html",
                "css",
                "javascript",
                "vim",
                "vimdoc",
                "r",
                "markdown",
                "rnoweb",
                "yaml",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            }
        },
        config = function(_,opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- {
    --     "windwp/nvim-ts-autotag",
    --     opts = {},
    -- },
}
