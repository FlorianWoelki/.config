vim.keymap.set("", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end)

vim.keymap.set("n", "<leader>rn", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set("n", "<leader>m", ":MRU<CR>", { noremap = true, silent = true })
