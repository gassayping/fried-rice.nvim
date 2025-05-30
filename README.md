# `Fried Rice.nvim`

Fried rice is a quick and easy meal to cook. This plugin makes it easy to quickly edit your config files from anywhere in your filesystem.

## Usage

`:Config` opens the folder which contains neovim's config file as defined by `vim.fn.stdpath("config")`

With configured search directories, the command can take an argument to open a file.

## Installation

For `lazy.nvim`

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

`:Config` will automatically be made available.

## Configuration

By default, `fried-rice.nvim` will open neovim's config folder. No other folders will be loaded unless they are passed as options to `M.setup()`.

### Search Dirs

search_dirs defines a list of paths where the plugin will search for files. Available files will be shown as options in command completion. An incomplete file name will automatically open the first file which starts with that string.

### Quick Maps

quick_maps defines aliases for specific paths. This is helpful for opening files that are placed in directories with lots of other files.
