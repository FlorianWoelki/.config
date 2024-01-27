vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    vim.opt.colorcolumn = "0"
    ColorMe()

    -- Illuminate plugin for highlighting all instances of the word under the cursor.
    local commonAttributes = "gui=none guibg=#444444"
    vim.cmd("hi IlluminatedWordRead " .. commonAttributes)
    vim.cmd("hi IlluminatedWordWrite " .. commonAttributes)
    vim.cmd("hi IlluminatedWordText " .. commonAttributes)
end)

