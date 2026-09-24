local map = vim.keymap.set

local function rename_file(bufnr)
	local old_name = vim.api.nvim_buf_get_name(bufnr)
	local new_name = vim.fn.input("New file name: ", old_name, "file")
	if new_name == "" or new_name == old_name then
		return
	end

	local params = {
		files = { { oldUri = vim.uri_from_fname(old_name), newUri = vim.uri_from_fname(new_name) } },
	}
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		if client:supports_method("workspace/willRenameFiles") then
			local response = client:request_sync("workspace/willRenameFiles", params, 1000, bufnr)
			if response and response.result then
				vim.lsp.util.apply_workspace_edit(response.result, client.offset_encoding)
			end
		end
	end

	if vim.fn.rename(old_name, new_name) ~= 0 then
		vim.notify("Could not rename " .. old_name, vim.log.levels.ERROR)
		return
	end
	vim.api.nvim_buf_set_name(bufnr, new_name)
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		if client:supports_method("workspace/didRenameFiles") then
			client:notify("workspace/didRenameFiles", params)
		end
	end
end

map({ "i", "v" }, "jk", "<Esc>")
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>cR", function()
			rename_file(args.buf)
		end, vim.tbl_extend("force", opts, { desc = "Rename file" }))
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set(
			"n",
			"<leader>cl",
			"<cmd>LspInfo<cr>",
			vim.tbl_extend("force", opts, { desc = "LSP information" })
		)

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/inlayHint") then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
			end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
		end
		if client and client:supports_method("textDocument/foldingRange") then
			vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
			vim.wo.foldmethod = "expr"
			vim.wo.foldenable = false
		end
	end,
})
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next Diagnostic" })
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev Diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
