-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

----@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        termguicolors = true, -- sets vim.opt.termguicolors
        expandtab = true, -- sets vim.opt.expandtab
        shiftwidth = 4, -- sets vim.opt.shiftwidth
        tabstop = 4, -- sets vim.opt.tabstop
        smartindent = true, -- sets vim.opt.smartindent
        mouse = "a", -- sets vim.opt.mouse
        timeoutlen = 300, -- sets vim.opt.timeoutlen
        cursorline = false, -- sets vim.opt.cursorline
      },
      g = { -- vim.g.<key>
        clipboard = {
          name = "macOS-clipboard",
          copy = {
            ["+"] = "pbcopy",
            ["*"] = "pbcopy",
          },
          paste = {
            ["+"] = "pbpaste",
            ["*"] = "pbpaste",
          },
          cache_enabled = 0,
        },
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        ["<Leader>ff"] = {
          function() require("telescope.builtin").find_files { hidden = true } end,
          desc = "Find files (hidden = true)",
        },
        ["<leader>fd"] = {
          function() require("custom_functions.change_directory").change_directory() end,
          desc = "Change Directory via Telescope",
        },
      },
    },
    autocmds = {
      go_format_on_save = {
        {
          event = "BufWritePre",
          pattern = "*.go",
          desc = "Run goimports on save",
          callback = function ()
            require("go.format").goimports()
          end,
        },
      },
      neotree_toggle_on_enter = {
        {
          event = "VimEnter",
          command = "Neotree toggle",
        },
      },
    },
  },
}
