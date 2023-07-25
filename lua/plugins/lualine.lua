return {
    "nvim-lualine/lualine.nvim",
    event = { "BufRead", "BufNewFile", "VimEnter" },
    opts = {
        options = {
            icons_enabled = false,
            theme = "auto",
            component_separators = "|",
            section_separators = "",
        },
    },
}
