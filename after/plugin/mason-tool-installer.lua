require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"prettier",
		"black",
		"typescript-language-server",
		"vue-language-server",
		"rust-analyzer",
		"eslint-lsp",
		"tailwindcss-language-server",
	},
	run_on_start = true,
})

require("mason-lspconfig").setup({
	handlers = {
		tailwindcss = function()
			require("lspconfig").tailwindcss.setup({
        filetypes = { "rust", "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
				init_options = {
					userLanguages = {
						rust = "html",
					},
				},
			})
		end,
	},
})
