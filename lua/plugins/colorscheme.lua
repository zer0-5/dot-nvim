return {
	"catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        require("catppuccin").setup({
            no_bold = true
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
