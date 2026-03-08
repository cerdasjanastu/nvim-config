return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                lazy = false
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_stategy = "horizontal",
                    sorting_strategy = "ascending",
                    layout_config = {
                        width = 0.99,
                        height = 0.99,
                        horizontal = {
                            prompt_position = "top",
                        }
                    },
                    mappings = {
                        n = {
                            ["<C-c>"] = "close"
                        }
                    },
                    -- file_ignore_patterns = { "%.git/", "%node_modules/", "%npm/" },
                    file_ignore_patterns = { "%.git/", "%npm/" },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                         -- the default case_mode is "smart_case"
                    }
                }
            })

            pcall(require("telescope").load_extension, "fzf")
        end
    },

    {
        "nvim-telescope/telescope-media-files.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            pcall(require("telescope").load_extension("media_files"))
            -- vim.keymap.set("n", "<leader>sm", function() require("telescope").extensions.media_files.media_files() end, {})
        end
    }
}
