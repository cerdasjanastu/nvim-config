return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        {
            "tpope/vim-dadbod",
            lazy = true
        },
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql" },
            lazy = true
        },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1

        -- changing the annoying default <C-c> in ftp sql
        vim.g.ftplugin_sql_omni_key = "<C-0>"
    end,
}
