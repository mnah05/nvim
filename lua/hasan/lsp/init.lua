local function load_lsp_files()
  local lsp_modules = {}
  local lsp_dir = vim.fn.stdpath("config") .. "/lua/hasan/lsp"
  local files = vim.fn.globpath(lsp_dir, "*.lua", false, true)
  
  for _, file in ipairs(files) do
    local module_name = file:match("hasan/lsp/(.-)%.lua$")
    if module_name and module_name ~= "init" then
      local ok, lsp_module = pcall(require, "hasan.lsp." .. module_name)
      if ok then
        table.insert(lsp_modules, lsp_module)
      else
        vim.notify("Failed to load LSP module: " .. module_name, vim.log.levels.ERROR)
      end
    end
  end
  
  return lsp_modules
end

return load_lsp_files()
