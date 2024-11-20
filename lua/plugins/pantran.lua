return {
  "potamides/pantran.nvim",
  keys = {
    { "<Leader>tw", "<cmd>Pantran<CR>", mode = { "n", "v" }, desc = "Show Translate Window" },
  },
  config = function()
    require("pantran").setup {
      default_engine = "deepl",
      engines = {
        deepl = {
          auth_key = "1b5cff76-1ba6-4ce5-9e3e-80be256ece85:fx",
          free_api = true,
        },
      },
      ui = {
        width_percentage = 0.8,
        height_percentage = 0.8,
      },
      window = {
        title_border = { "⭐️ ", " ⭐️" },
        window_config = { border = "rounded" },
      },
      controls = {
        mappings = { -- Help Popup order cannot be changed
          edit = {
            -- normal mode mappings
            n = {
              -- ["j"] = "gj",
              -- ["k"] = "gk",
              ["S"] = require("pantran.ui.actions").switch_languages,
              ["e"] = require("pantran.ui.actions").select_engine,
              ["s"] = require("pantran.ui.actions").select_source,
              ["t"] = require("pantran.ui.actions").select_target,
              ["<C-y>"] = require("pantran.ui.actions").yank_close_translation,
              ["g?"] = require("pantran.ui.actions").help,
              --disable default mappings
              ["<C-Q>"] = false,
              ["gA"] = false,
              ["gS"] = false,
              ["gR"] = false,
              ["ga"] = false,
              ["ge"] = false,
              ["gr"] = false,
              ["gs"] = false,
              ["gt"] = false,
              ["gY"] = false,
              ["gy"] = false,
            },
            -- insert mode mappings
            i = {
              ["<C-y>"] = require("pantran.ui.actions").yank_close_translation,
              ["<C-t>"] = require("pantran.ui.actions").select_target,
              ["<C-s>"] = require("pantran.ui.actions").select_source,
              ["<C-e>"] = require("pantran.ui.actions").select_engine,
              ["<C-S>"] = require("pantran.ui.actions").switch_languages,
            },
          },
          -- Keybindings here are used in the selection window.
          select = {},
        },
      },
    }
  end,
}
