return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "github/copilot.vim",
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "copilot-chat" },
      },
      ft = { "markdown", "copilot-chat" },
    },
  },
  build = "make tiktoken",
  opts = {},
}
