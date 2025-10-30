return {
    {
        "saghen/blink.compat",
        version = "2.*",
        lazy = true,
        opts = {},
    },

    {
        "saghen/blink.cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "kristijanhusak/vim-dadbod-ui",
            "ray-x/cmp-sql",
            "R-nvim/cmp-r",
        },
        version = "1.*",
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset        = "none",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"]     = { "hide" },
                ["<C-y>"]     = { "select_and_accept" },
                ["<Up>"]      = { "select_prev", "fallback" },
                ["<Down>"]    = { "select_next", "fallback" },
                ["<C-p>"]     = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"]     = { "select_next", "fallback_to_mappings" },
                ["<C-g>"]     = { "scroll_documentation_up", "fallback" },
                ["<C-b>"]     = { "scroll_documentation_down", "fallback" },
                ["<C-l>"]     = { "snippet_forward", "fallback" },
                ["<C-h>"]     = { "snippet_backward", "fallback" },
                ["<C-k>"]     = { "show_signature", "hide_signature", "fallback" },
            },

            snippets = {
                preset = "luasnip",
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    window = {
                        border = "rounded",
                    },
                    auto_show = true,
                    auto_show_delay_ms = 100,
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
                menu = {
                    draw = {
                        columns = {
                            { "label",       "label_description", gap = 1 },
                            { "kind_icon",   "kind" },
                            { "source_name", gap = 1 },
                        },
                    },
                },
                ghost_text = {
                    enabled = false,
                },
            },

            signature = {
                enabled = false,
                trigger = {
                    enabled = true,
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },

                per_filetype = {
                    sql = { "snippets", "dadbod", "buffer", "sql" },
                    lua = { inherit_defaults = true, "lazydev" },
                    r = { "snippets", "buffer", "cmp_r" },
                },
                providers = {
                    lsp = { fallbacks = {} },  -- we want buffer showed regardless lsp active or not returning items
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                    },
                    sql = {
                        name = "sql",
                        module = "blink.compat.source",
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                    },
                    cmp_r = {
                        name = "cmp_r",
                        module = "blink.compat.source",
                    },
                },
            },

            fuzzy = {
                implementation = "prefer_rust",
                max_typos = function(s) return math.floor(#s / 4) end,
                -- use_frecency = true,
                use_proximity = true,
            }
        },
        opts_extend = { "sources.default" }
    },
}
