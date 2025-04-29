return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = "  ",
				path_display = { "smart" },
				winblend = 10,
				border = {},
				borderchars = {
					prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = function(prompt_bufnr)
							actions.send_selected_to_qflist(prompt_bufnr)
							actions.open_qflist(prompt_bufnr)
						end,
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
					width = 0.95,
					height = 0.85,
					preview_cutoff = 100,
				},
				sorting_strategy = "ascending",
			},
			pickers = {
				find_files = { hidden = true },
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						winblend = 15,
						previewer = false,
					}),
				},
			},
		})

		-- Load extensions safely
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "live_grep_args")
		pcall(telescope.load_extension, "ui-select")

		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<CR>", { desc = "Live grep in cwd" })
		keymap.set("n", "<leader>sc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep_args<CR>", { desc = "Live grep with args" })

		-- 🎨 Kanagawa Paper Ink style highlights for Telescope
		local colors = require("kanagawa-paper.colors").setup().palette
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.sumiInk0, fg = colors.fujiWhite })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = colors.sumiInk0, fg = colors.sumiInk2 })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = colors.sumiInk1 })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = colors.sumiInk1, fg = colors.sumiInk2 })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.roninYellow, bold = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = colors.fujiGray })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = colors.waveAqua1 })
	end,
}
