local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"volar",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	local function on_list(options)
		vim.fn.setqflist({}, " ", options)
		vim.api.nvim_command("cfirst")
	end

	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition({
			on_list = on_list,
		})
	end, opts)
	vim.keymap.set("n", "gD", function()
		vim.cmd([[
    vsplit
    ]])
		vim.lsp.buf.definition({ on_list = on_list })
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "•",
		warn = "•",
		hint = "•",
		info = "•"
	},
})

lsp.setup()

vim.wo.signcolumn = "yes:1"
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})
