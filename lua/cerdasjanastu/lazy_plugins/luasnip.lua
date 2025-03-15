return {
    {
        "L3MON4D3/LuaSnip",
        build = (function()
            if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
                return
            end
            return "make install_jsregexp"
        end)(),
        dependencies = { "mstuttgart/vscode-odoo-snippets" },
        config = function ()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", {"jsdoc"})
            require("luasnip.loaders.from_vscode").lazy_load({})
        end
    },
}
