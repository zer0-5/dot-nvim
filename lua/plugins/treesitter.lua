return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc",
                    "c",
                    "cpp",
                    "lua",
                    "rust",
                    "json",
                    "yaml",
                    "markdown",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        enabled = true,
    },
}
