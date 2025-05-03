return {
	"epwalsh/obsidian.nvim",
	version = "*", -- use latest stable release
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",     -- Required
		"hrsh7th/nvim-cmp",          -- Autocompletion
		"nvim-telescope/telescope.nvim", -- Fuzzy finding
		"nvim-treesitter/nvim-treesitter", -- Enhanced syntax highlighting
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "/Users/cix9ine/Notes/",
			},
		},

		completion = {
			nvim_cmp = true, -- Smart link + tag completion
		},

		new_notes_location = "current_dir", -- Create new notes in the current directory

		ui = {
			enable = true,
			update_debounce = 200, -- Smooth updates for inline elements
		},

		note_id_func = function(title)
			-- Clean, readable note IDs
			return tostring(os.time()) .. "-" .. title:gsub(" ", "-"):lower()
		end,

		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url }) -- Open URLs in browser (macOS)
		end,

		daily_notes = {
			folder = "daily", -- Clean daily note structure
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
		},

		use_advanced_uri = true, -- Obsidian URI support
		open_app_foreground = true, -- Focus Obsidian app on open
	},
}
