local M = {}

---@class fried_rice_config
---@field search_dirs table
---@field quick_maps table

---@type fried_rice_config
local config = { search_dirs = {}, quick_maps = {} }

-- Set plugin config options
---@param opts? fried_rice_config
function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

local function get_dir_name(partial)
	for _, dir in pairs(config.search_dirs) do
		for path in vim.fs.dir(dir) do
			if string.sub(path, 0, string.len(partial)) == partial then
				return vim.fs.joinpath(dir, path)
			end
		end
	end
	return nil
end

vim.api.nvim_create_user_command("Config", function(opts)
	if opts.fargs[1] == nil then
		vim.cmd.edit(vim.fn.stdpath("config"))
		return
	end

	local filepath = config.quick_maps[opts.fargs[1]]
	if filepath == nil then
		filepath = get_dir_name(opts.fargs[1])
	end
	if opts.fargs[2] ~= nil then
		filepath = vim.fs.joinpath(filepath, opts.fargs[2])
	end
	vim.cmd.edit(filepath)
end, {
	nargs = "*",
	complete = function(argLead)
		local keys = {}
		for _, dir in pairs(config.search_dirs) do
			for path in vim.fs.dir(dir) do
				if argLead == "" or string.sub(path, 0, string.len(argLead)) == argLead then
					table.insert(keys, path)
				end
			end
		end

		for key, _ in pairs(config.quick_maps) do
			if argLead == "" or string.sub(key, 0, string.len(argLead)) == argLead then
				table.insert(keys, key)
			end
		end
		return keys
	end
})

return M
