return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {"<leader>ao", "<cmd>AerialToggle!<CR>", mode = {"n"}, desc = "Toggle Aerial"},
    }
}
