local M = {}
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local Path = require "plenary.path"
local scandir = require "plenary.scandir"

local function get_custom_directories(base_dir, custom_paths, add_paths)
  local dirs = {}
  local dir_map = {}

  scandir.scan_dir(base_dir, {
    hidden = false,
    only_dirs = true,
    depth = 1,
    on_insert = function(entry)
      local name = Path:new(entry):make_relative(base_dir)
      local full_path = Path:new(base_dir, name):absolute()

      for _, custom_path in ipairs(custom_paths) do
        if name == custom_path.name then
          local custom_full_path = Path:new(full_path, custom_path.path):absolute()
          table.insert(dirs, name)
          dir_map[name] = custom_full_path
          return
        end
      end

      table.insert(dirs, name)
      dir_map[name] = full_path
    end,
  })

  for _, add_path in ipairs(add_paths) do
    local name = add_path.name
    local path_command = add_path.path_command
    local path = load("return " .. path_command)()
    table.insert(dirs, name)
    dir_map[name] = path
  end

  return dirs, dir_map
end

function M.change_directory()
  local config = require("custom_functions.config")
  local directories, dir_map = get_custom_directories(config.base_dir, config.custom_paths, config.add_paths)

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
