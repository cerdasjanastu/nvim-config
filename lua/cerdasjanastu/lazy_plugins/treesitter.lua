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
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        },
    },

    -- {
    --     "windwp/nvim-ts-autotag",
    --     opts = {},
    -- },
}
