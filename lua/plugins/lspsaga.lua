return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    finder = {
      max_height = 0.6,
      default = "tyd+ref+imp+def",
      keys = {
        toggle_or_open = "<CR>",
        vsplit = "v",
        split = "s",
        tabnew = "t",
        tab = "T",
        quit = "q",
        close = "<ESC>",
      },

      methods = {
        tyd = "textDocument/typeDefinition",
      },
    },
  },
  keys = {
    { "<leader>,", "<cmd>Lspsaga finder<CR>", mode = { "n" }, desc = "Show LSP Finder" },
  },
}
