vim.api.nvim_create_user_command("Config", function ()
	require("fried-rice.nvim").goon()
end, {})
