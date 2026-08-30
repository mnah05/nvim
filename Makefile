.PHONY: check format

check:
	@nvim --headless -i NONE '+qa'
	@if command -v stylua >/dev/null 2>&1; then stylua --check lua; else echo "stylua not installed; skipping Lua format check"; fi

format:
	@stylua lua
