return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({ stages = "fade" }) -- Animated message fade
		vim.notify = require("notify") -- Replaces the default `:echo`
	end,
}
