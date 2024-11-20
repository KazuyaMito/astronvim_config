return {
  "akinsho/toggleterm.nvim",
  opts = {
    on_open = function(term)
      local current_dir = vim.fn.getcwd()
      if not term.cmd or not string.find(term.cmd, "lazygit") then
        term:send("cd " .. current_dir, false)
      end
    end,
  },
}
