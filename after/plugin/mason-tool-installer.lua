require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettier",
		"typescript-language-server",
		"vue-language-server",
		"rust-analyzer",
		"eslint-lsp",
		"tailwindcss-language-server",
	},
	run_on_start = true,
})
