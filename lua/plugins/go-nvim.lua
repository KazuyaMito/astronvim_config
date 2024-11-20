return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  opts = {
    goimports = "gopls",
    lsp_cfg = true,
    lsp_gofumpt = false,
    lsp_keymaps = false,
    lsp_inlay_hints = {
      enable = false,
    },
  },
}
