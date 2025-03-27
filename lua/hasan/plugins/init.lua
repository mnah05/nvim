local function load_plugin_files()
	local plugins = {}
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/hasan/plugins"
	local files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local module_name = file:match("hasan/plugins/(.-)%.lua$")
		if module_name and module_name ~= "init" then
			local ok, plugin = pcall(require, "hasan.plugins." .. module_name)
			if ok then
				table.insert(plugins, plugin)
			else
				vim.notify("Failed to load plugin: " .. module_name, vim.log.levels.ERROR)
			end
		end
	end

	return plugins
end

return load_plugin_files()
