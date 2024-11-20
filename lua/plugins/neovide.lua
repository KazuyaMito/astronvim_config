if not vim.g.neovide then
  return {} -- do nothing
end

return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = {
        guifont = "Hack Nerd Font Mono:h14",
      },
      g = {
        neovide_refresh_rate = 120,
        neovide_refresh_rate_idle = 120,
        neovide_window_blurred = true,
        neovide_floating_blur_amount_x = 2.0,
        neovide_floating_blur_amount_y = 2.0,
        neovide_floating_shadow = true,
        neovide_floating_z_height = 10,
        neovide_light_angle_degreesss = 45,
        neovide_light_radius = 5,
        neovide_scroll_animation_length = 0.3,
        neovide_transparency = 0.8,
        neovide_show_border = true,
        neovide_remember_window_size = true,
      },
    },
    mappings = {
      n = {
        ["<D-s>"] = {
          ':w<CR>'
        },
        ["<D-v>"] = {
          '"+P'
        },
      },
      v = {
        ["<D-c>"] = {
          '"+y'
        },
        ["<D-v>"] = {
          '"+P'
        },
      },
      c = {
        ["<D-v>"] = {
          '<C-R>+'
        },
      },
      i = {
        ["<D-v>"] = {
          '<ESC>l"+Pli'
        },
      },
      t = {
        ["<D-v>"] = {
          '<C-\\><C-N>"+P:startinsert<CR>'
        },
      }
    },
  },
}
