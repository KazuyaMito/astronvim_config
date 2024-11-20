local M = {}
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Path = require "plenary.path"

local function get_custom_directories(base_dir)
  local dirs = {}
  local dir_map = {}

  local scandir = vim.loop.fs_scandir(base_dir)
  if scandir then
    while true do
      local name, type = vim.loop.fs_scandir_next(scandir)
      if not name then break end
      local full_path = Path:new(base_dir, name):absolute()

      if type == "directory" then
        if name == "atami" then
          local custom_path = Path:new(full_path, "src/github.com/fastmedia/atami"):absolute()
          table.insert(dirs, name)
          dir_map[name] = custom_path
        elseif name == "kurobe" then
          local custom_path = Path:new(full_path, "src/github.com/fastmedia/kurobe"):absolute()
          table.insert(dirs, name)
          dir_map[name] = custom_path
        else
          table.insert(dirs, name)
          dir_map[name] = full_path
        end
      end
    end
  end

  local nvim_lua_dir = vim.fn.stdpath("config") .. "/lua"
  local name = "nvim config"
  table.insert(dirs, name)
  dir_map[name] = nvim_lua_dir

  local user_root_dir = "~/"
  local user_root_name = "user_root_dir"
  table.insert(dirs, user_root_name)
  dir_map[user_root_name] = user_root_dir

  return dirs, dir_map
end

function M.change_directory()
  local config = require("custom_functions.config")
  local directories, dir_map = get_custom_directories(config.base_dir)

  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values

  pickers.new({}, {
      prompt_title = "Select Directory",
      finder = finders.new_table {
        results = directories,
      },
      sorter = conf.generic_sorter({}),
      attach_mappings = function()
        actions.select_default:replace(function(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          local selected_path = dir_map[selection[1]]
          vim.cmd("cd " .. selected_path)
        end)
        return true
      end,
    })
    :find()
end

return M

