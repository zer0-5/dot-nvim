return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>xx", ":TroubleToggle<cr>" },
        { "<leader>xw", ":TroubleToggle workspace_diagnostics<cr>" },
        { "<leader>xd", ":TroubleToggle document_diagnostics<cr>" },
        { "<leader>xq", ":TroubleToggle quickfix<cr>" },
        { "<leader>xl", ":TroubleToggle loclist<cr>" },
        { "gr",         ":TroubleToggle lsp_references<cr>" },
    },
    opts = {},
}
