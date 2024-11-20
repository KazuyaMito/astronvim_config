-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.editing-support/chatgpt-nvim" },
  { import = "astrocommunity.editing-support/auto-save-nvim" },
  { import = "astrocommunity.completion/copilot-lua-cmp" },
  { import = "astrocommunity.completion/cmp-spell" },
  { import = "astrocommunity.completion/cmp-emoji" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  -- import/override with your plugins folder
}
