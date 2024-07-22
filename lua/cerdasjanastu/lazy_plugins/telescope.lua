return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        tag = "0.1.8",
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
                        horizontal = {
                            prompt_position = "top",
                        }
                    },
                    mappings = {
                        n = {
                            ["<C-c>"] = "close"
                        }
                    }
                },
            })

            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>sit", builtin.git_files, {})
            vim.keymap.set("n", "<leader>sw", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>sW", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>sr", builtin.resume, {})
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})
            vim.keymap.set("n", '<leader>sh', builtin.help_tags, {})
            vim.keymap.set("n", "<leader>ss", builtin.builtin, {})
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})

            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                    previewer = false,
                })
            end, {})

            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end, {})

            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end, {})

        end
    },
}
