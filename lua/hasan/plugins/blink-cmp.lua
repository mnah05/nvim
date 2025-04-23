return {
	-- Main completion engine plugin
	'saghen/blink.cmp',

	-- Optional: Snippets support for a wide variety of languages
	dependencies = { 'rafamadriz/friendly-snippets' },

	-- Use a stable release tag
	version = '1.*',

	-- Uncomment one of these if you want to build from source
	-- build = 'cargo build --release',
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- Key mappings: use Enter to accept completions
		-- Other presets include: 'default', 'super-tab', 'none'
		keymap = { preset = 'enter' },

		-- Appearance tweaks: ensures icon alignment
		appearance = {
			nerd_font_variant = 'mono'
		},

		-- Documentation popup only shown when manually triggered
		completion = {
			documentation = { auto_show = false },
		},

		-- Completion sources in priority order
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		-- Fuzzy matching with Rust backend if available
		fuzzy = {
			implementation = "prefer_rust_with_warning"
		}
	},

	-- Enables extending sources.default from elsewhere in your config
	opts_extend = { "sources.default" }
}
