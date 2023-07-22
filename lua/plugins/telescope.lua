return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
        cmd = "Telescope",
        keys = {
            { "<leader><space>", ":Telescope find_files<cr>",   desc = "find files" },
            { "<leader>b",       ":Telescope buffers<cr>",      desc = "opened [b]uffers" },
            { "<leader>fw",      ":Telescope grep_string<cr>",  desc = "[f]ind [w]ord" },
            { "<leader>fg",      ":Telescope live_grep<cr>",    desc = "[f]ind [g]rep" },
            { "<leader>/",       ":Telescope file_browser<cr>", desc = "browse files from project root" },
            {
                "<leader>.",
                ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
                desc = "browse files from current directory"
            },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "  ",
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
            })
            telescope.load_extension("file_browser")
        end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
}
