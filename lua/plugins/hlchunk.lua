return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    chunk = {
      enable = true,
      duration = 0,
      delay = 0,
    },
    indent = {
      enable = true,
    },
    line_num = {
      enable = true,
    },
    blank = {
      enable = true,
    },
  },
}
