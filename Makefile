.PHONY: check format install-prerequisites install-prerequisites-macos install-prerequisites-debian

install-prerequisites:
	@if command -v brew >/dev/null 2>&1; then \
		$(MAKE) install-prerequisites-macos; \
	elif command -v apt-get >/dev/null 2>&1; then \
		$(MAKE) install-prerequisites-debian; \
	else \
		echo "Unsupported package manager. See README.md for manual installation commands."; \
		exit 1; \
	fi

install-prerequisites-macos:
	brew install neovim git fd ripgrep tree-sitter-cli lazygit node python go rustup llvm unzip
	rustup default stable
	rustup component add rustfmt

install-prerequisites-debian:
	sudo apt-get update
	sudo apt-get install -y neovim git build-essential fd-find ripgrep tree-sitter-cli lazygit nodejs npm python3 golang rustup clangd clang-format unzip
	rustup default stable
	rustup component add rustfmt

check:
	@nvim --headless -i NONE '+qa'
	@if command -v stylua >/dev/null 2>&1; then stylua --check lua; else echo "stylua not installed; skipping Lua format check"; fi

format:
	@stylua lua
