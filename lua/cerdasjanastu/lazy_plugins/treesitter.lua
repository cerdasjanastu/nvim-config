return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
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
            })
        end
    },

    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
}
