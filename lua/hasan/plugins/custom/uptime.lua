-- Store Neovim start time
local start_time = os.time()

-- Function to calculate uptime
local function get_uptime()
  local current_time = os.time()
  local elapsed = os.difftime(current_time, start_time)

  -- Convert seconds to hours, minutes, seconds
  local hours = math.floor(elapsed / 3600)
  local minutes = math.floor((elapsed % 3600) / 60)
  local seconds = elapsed % 60

  return string.format("Neovim Uptime: %02d:%02d:%02d", hours, minutes, seconds)
end

-- Command to show uptime
vim.api.nvim_create_user_command("Uptime", function()
  print(get_uptime())
end, {})
