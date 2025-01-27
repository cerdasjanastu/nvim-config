return {
    {
        "numToStr/Comment.nvim",
        opts = {}
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
