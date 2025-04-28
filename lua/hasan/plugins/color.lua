return {
	-- First, add the zenburn colorscheme
	{
		"phha/zenburn.nvim",
		lazy = false,
		priority = 1000, -- Make sure it loads first
	},

	-- Then configure lush.nvim
	{
		"rktjmp/lush.nvim",
		priority = 999,
		config = function()
			-- Wait for the colorscheme to be available
			vim.defer_fn(function()
				-- 1. Set the colorscheme
				vim.cmd.colorscheme("zenburn")
			end, 100)

			-- 2. Create a single autocmd group for all color customizations
			local color_customization = vim.api.nvim_create_augroup("color_customization", { clear = true })

			-- 3. Setup custom color overrides with a single autocmd
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = color_customization,
				pattern = "*",
				callback = function()
					local colorscheme = vim.g.colors_name
					if not colorscheme then return end

					local function sethl(group, opts)
						vim.api.nvim_set_hl(0, group, opts)
					end

					-- Dark yellowish theme base colors
					local darker_bg = "#151515"
					local dark_bg = "#1a1a16" -- Slightly yellow tinted dark background
					local medium_bg = "#222218" -- Medium dark background with yellow tint
					local yellow_tint = "#d1cc9b" -- Soft yellow for highlights
					local text_color = "#e4e0c7" -- Yellowish white text
					local comment_color = "#777755" -- Darker yellow for comments
					local selection_bg = "#403d30" -- Darker yellowish selection background
					local border_color = "#353520" -- Border with yellow tint

					-- Common overrides across all themes - apply our dark yellowish theme
					sethl("Normal", { fg = text_color, bg = dark_bg })
					sethl("NormalFloat", { fg = text_color, bg = darker_bg })
					sethl("StatusLine", { fg = text_color, bg = darker_bg })
					sethl("StatusLineNC", { fg = comment_color, bg = darker_bg })
					sethl("SignColumn", { bg = darker_bg })
					sethl("VertSplit", { fg = border_color, bg = darker_bg })
					sethl("WinSeparator", { fg = border_color, bg = darker_bg })

					-- Line numbers with yellowish tint
					sethl("LineNrAbove", { fg = "#666655", bg = darker_bg })
					sethl("LineNrBelow", { fg = "#666655", bg = darker_bg })
					sethl("LineNr", { fg = yellow_tint, bg = darker_bg })

					-- Selection and search highlights
					sethl("Visual", { bg = selection_bg })
					sethl("Search", { fg = darker_bg, bg = yellow_tint })
					sethl("IncSearch", { fg = darker_bg, bg = yellow_tint })

					-- Comments with yellowish tint
					sethl("Comment", { fg = comment_color, italic = false })
					sethl("TSComment", { fg = comment_color, italic = false })

					-- Popup menu with yellowish tint
					sethl("Pmenu", { fg = text_color, bg = medium_bg })
					sethl("PmenuSel", { fg = darker_bg, bg = yellow_tint })

					-- Diagnostics with yellowish tint
					sethl("DiagnosticError", { fg = "#dd9977" })
					sethl("DiagnosticWarn", { fg = "#ddbb77" })
					sethl("DiagnosticInfo", { fg = "#99bb88" })
					sethl("DiagnosticHint", { fg = "#88aaaa" })
					sethl("DiagnosticVirtualTextError", { fg = "#994433" })

					-- Syntax highlighting with yellowish tint
					sethl("String", { fg = "#bbaa77" })
					sethl("Number", { fg = "#ccbb88" })
					sethl("Boolean", { fg = "#ccbb88" })
					sethl("Function", { fg = "#c3b577" })
					sethl("Keyword", { fg = "#d8c17d" })
					sethl("Identifier", { fg = "#c5bb99" })

					-- Apply theme-specific additional overrides
					if string.find(colorscheme, "base16") then
						-- Additional Base16 Theme Overrides
						sethl("CursorLine", { bg = medium_bg })
					elseif colorscheme == "zenburn" then
						-- Additional Zenburn Overrides
						sethl("CursorLine", { bg = medium_bg })
					elseif colorscheme == "zenbones" then
						-- Additional Zenbones Overrides
						sethl("CursorLine", { bg = medium_bg })
					elseif colorscheme == "cosec-twilight" then
						-- Additional Cosec Twilight Overrides
						sethl("CursorLine", { bg = medium_bg })
					end
				end,
			})

			-- 4. Remove italics for zen* themes - use the same augroup
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = color_customization,
				pattern = "zen*",
				callback = function()
					vim.api.nvim_set_hl(0, "Comment", { italic = false })
					vim.api.nvim_set_hl(0, "Constant", { italic = false })
				end
			})

			-- 5. Define custom commands to manually apply styles if needed
			vim.api.nvim_create_user_command("VagueLine", function()
				vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#646455" })
				vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#646455" })
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#d1cc9b" })
			end, {})

			vim.api.nvim_create_user_command("MyLine", function()
				vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666655", bg = "#151515" })
				vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666655", bg = "#151515" })
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#d1cc9b", bg = "#151515" })
			end, {})

			-- Command to apply the dark yellowish theme
			vim.api.nvim_create_user_command("DarkYellowTheme", function()
				local darker_bg = "#151515"
				local dark_bg = "#1a1a16" -- Slightly yellow tinted dark background
				local medium_bg = "#222218" -- Medium dark background with yellow tint
				local yellow_tint = "#d1cc9b" -- Soft yellow for highlights
				local text_color = "#e4e0c7" -- Yellowish white text
				local comment_color = "#777755" -- Darker yellow for comments

				vim.api.nvim_set_hl(0, "Normal", { fg = text_color, bg = dark_bg })
				vim.api.nvim_set_hl(0, "NormalFloat", { fg = text_color, bg = darker_bg })
				vim.api.nvim_set_hl(0, "StatusLine", { fg = text_color, bg = darker_bg })
				vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#666655", bg = darker_bg })
				vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#666655", bg = darker_bg })
				vim.api.nvim_set_hl(0, "LineNr", { fg = yellow_tint, bg = darker_bg })
				vim.api.nvim_set_hl(0, "Comment", { fg = comment_color, italic = false })
			end, {})

			-- 6. Status line commands
			vim.api.nvim_create_user_command("DefStatus", function()
				local lualine_status, lualine = pcall(require, "lualine")
				if lualine_status then
					lualine.setup({ options = { theme = "auto" } })
				end
			end, {})

			vim.api.nvim_create_user_command("VagueStatus", function()
				local lualine_status, lualine = pcall(require, "lualine")
				if not lualine_status then return end

				local theme_status, custom_theme = pcall(require, "lualine.themes.iceberg_dark")
				if not theme_status then return end

				-- Modify the theme to have yellowish tints
				custom_theme.normal.a.bg = "#a69f77"
				custom_theme.normal.b.fg = "#d1cc9b"
				custom_theme.normal.b.bg = "#222218"
				custom_theme.normal.c.fg = "#c5c199"
				custom_theme.normal.c.bg = "#1a1a16"

				custom_theme.insert.a.bg = "#aa9977"
				custom_theme.visual.a.bg = "#998866"
				custom_theme.replace.a.bg = "#997755"

				custom_theme.inactive.a.bg = "#333322"
				custom_theme.inactive.b.bg = "#222218"
				custom_theme.inactive.c.bg = "#1a1a16"

				lualine.setup({
					options = {
						theme = custom_theme,
					},
				})
			end, {})

			-- Apply dark yellow theme immediately
			vim.defer_fn(function()
				vim.cmd("DarkYellowTheme")
			end, 200)
		end,
	},

	-- If you're using zenbones, add it here
	{
		"mcchrish/zenbones.nvim",
		lazy = true,
		dependencies = { "rktjmp/lush.nvim" },
	},

	-- Add any other colorschemes that you're using
	-- For example:
	-- {
	--   "username/cosec-twilight",
	--   lazy = true,
	-- },
}
