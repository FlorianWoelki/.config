require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"black",
		"typescript-language-server",
		"rust-analyzer",
		"eslint-lsp",
		"tailwindcss-language-server",
		"gopls",
		"goimports",
	},
	run_on_start = true,
})

require("mason-lspconfig").setup({
	automatic_enable = true,
})

vim.lsp.config("tailwindcss", {
	filetypes = {
		"rust",
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"django-html",
		"edge",
		"eelixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	init_options = {
		userLanguages = {
			rust = "html",
		},
	},
})

vim.lsp.enable("tailwindcss")
