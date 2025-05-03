local M = {}

function M.open_todo_window()
  local buf = vim.api.nvim_create_buf(false, true)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win_opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_opts)

  vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')

  local todo_path = vim.fn.expand("~/todo-nvim.md")
  if vim.fn.filereadable(todo_path) == 1 then
    vim.api.nvim_command('silent read ' .. todo_path)
  end

  vim.api.nvim_buf_set_name(buf, todo_path)
  vim.api.nvim_buf_set_option(buf, 'buftype', '')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', { noremap = true, silent = true })
end

return {
  "XisEnine/test-todo",  -- Replace this with your actual plugin name or URL
  cmd = "OpenTodo",   -- This ensures lazy loading when the command is run
  config = function()
    vim.api.nvim_create_user_command("OpenTodo", M.open_todo_window, {})
  end,
}
