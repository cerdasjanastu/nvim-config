return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    enabled = true,
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>fm",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            javascript = {
                "prettierd",
                "prettier",
                stop_after_first = true,
            },
            go = { "gofmt" },
            py = { "ruff" },
            json = { "jq" },
            sql = { "sleek" },
            xml = { "xmlformatter" },
            -- xml = { "prettierd" },
        },
        -- Set default options
        default_format_opts = {
            lsp_format = "fallback",
        },
        -- Set up format-on-save
        -- format_on_save = { timeout_ms = 500 },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
            xmlformatter = {
                prepend_args = {
                    "--indent", "4",
                    "--selfclose",
                    "--preserve", "script,style",  -- preserve these
                    "--blanks",  -- preserve blank
                    "--preserve-attribute",
                    "--disable-inlineformatting",
                    "--disable-correction",
                },
            },
        },
    },
    -- init = function()
    --     -- If you want the formatexpr, here is the place to set it
    --     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- end,
}
