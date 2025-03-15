return {
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function()
            require("Comment").setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = "gcc",
                    ---Block-comment toggle keymap
                    block = "gbc",
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = "gc",
                    ---Block-comment keymap
                    block = "gb",
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = "gcO",
                    ---Add comment on the line below
                    below = "gco",
                    ---Add comment at the end of line
                    eol = "gcA",
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won"t create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
                ---Function to call before (un)comment
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
                ---Function to call after (un)comment
                post_hook = nil,
            })
        end
    },

    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            signs = false
        }
    },

    {
        "godlygeek/tabular",
        cmd = { "Tabularize" }, -- Load only when Tabularize is used
    },

    -- {
    --     "echasnovski/mini.nvim",
    --     config = function()
    --         -- Better Around/Inside textobjects
    --         --
    --         -- Examples:
    --         --  - va)  - [V]isually select [A]round [)]paren
    --         --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --         --  - ci'  - [C]hange [I]nside [']quote
    --         require("mini.ai").setup({ n_lines = 500 })
    --
    --         -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --         --
    --         -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    --         -- - sd'   - [S]urround [D]elete [']quotes
    --         -- - sr)'  - [S]urround [R]eplace [)] [']
    --         require("mini.surround").setup({})
    --
    --         -- Simple and easy statusline.
    --         --  You could remove this setup call if you don't like it,
    --         --  and try some other statusline plugin
    --         local statusline = require "mini.statusline"
    --         statusline.setup({
    --             use_icons = false,
    --         })
    --
    --         ---@diagnostic disable-next-line: duplicate-set-field
    --         statusline.section_location = function()
    --             return "%2l:%-2v"
    --         end
    --         statusline.section_git = function()
    --             return "%{FugitiveStatusline()}"
    --         end
    --         statusline.section_lsp = function()
    --             return ""
    --         end
    --         statusline.section_diff = function()
    --             return ""
    --         end
    --     end,
    -- },

}
