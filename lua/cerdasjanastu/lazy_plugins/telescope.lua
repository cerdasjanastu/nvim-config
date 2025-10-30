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
                    file_ignore_patterns = { "%.git/", "venv/", "%node_modules/", "%npm/" },
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

            pcall(require('telescope').load_extension, 'fzf')
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader>sf", function() builtin.find_files({ hidden = true }) end, {})
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
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})
            vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
            vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})

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
