return {
  "linrongbin16/gitlinker.nvim",
  cmd = { "GitLinker" },
  opts = {},
  keys = {
    { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
    { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
  },
}
