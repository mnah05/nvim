return {
	"MeanderingProgrammer/render-markdown.nvim",
	config = function()
		require("render-markdown").setup({
			render_modes = true,
			theme = "light",
			auto_enable = false, -- Turn off global auto-enable
			conceal = true,
			filetypes = { "markdown", "md" },

			-- Optional custom logic to enable rendering selectively
			on_attach = function(bufnr)
				local filepath = vim.api.nvim_buf_get_name(bufnr)
				if not filepath:match("^/Users/cix9ine/Notes/") then
					require("render-markdown").enable(bufnr)
				end
			end,
		})
	end,
}
