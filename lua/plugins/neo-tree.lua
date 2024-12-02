return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 60,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { ".git", ".vscode", ".DS_Store", "thumbs.db" },
        never_show = {},
      },
      default_component_configs = {
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
      },
    },
  },
}
