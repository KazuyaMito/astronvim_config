# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### custom_functions configuration
```lua
local config = {
    base_dir = "/path/to/base/dir",
    --- Set the directory you want to display by digging the hierarchy from the base directory.
    custom_paths = {
        {
            name = "path name",
            path = "path/to/custom/dir",
        },
    },
    --- Set the directory you want to display by executing the command.
    add_paths = {
        {
            name = "path name",
            path_command = "vim.fn.stdpath('config') .. '/lua'"
        },
        {
            name = "path name2",
            path_command = "os.getenv('HOME')"
        },
    },
}
```
