local lsp = require("lsp-zero")

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

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})

vim.wo.signcolumn = "yes:1"
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})
