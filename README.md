# `Fried Rice.nvim`

Fried rice is a quick and easy meal to cook. This plugin enables you to quickly edit your config files from anywhere in your filesystem.

## Usage

`:Config` opens the folder which contains neovim's config file as defined by `vim.fn.stdpath("config")`

With configured search directories, the command can take an argument to open a file.

## Installation

For `lazy.nvim`

```lua
{
    "gassayping/fried-rice.nvim",
    opts = {}
}
```

`:Config` will automatically be made available.

## Configuration

By default, `fried-rice.nvim` will open neovim's config folder. No other folders will be loaded unless they are passed as options to `M.setup()`.

Example setup options:

```lua
{
    "gassayping/fried-rice.nvim",
    opts = {
        search_dirs = {
            "~/.config/",
            "~/.config/nvim/lua/plugins/",
        },
        quick_maps = {
            zsh = "~/.zshrc"
        }
    }
}
```

