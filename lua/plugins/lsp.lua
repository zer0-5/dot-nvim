return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require("lsp-zero.settings").preset({})
        end
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require("lsp-zero.cmp").extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")

            cmp.setup({
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                }
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require("lsp-zero")

            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                lsp.buffer_autoformat()
            end)

            -- (Optional) Configure lua language server for neovim
            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },
}
