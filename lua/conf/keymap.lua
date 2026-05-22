local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "jk", "<Esc>", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Window navigation+resizing
-- keymap("n", "sh", "<C-w>h", opts)
-- keymap("n", "sk", "<C-w>k", opts)
-- keymap("n", "sj", "<C-w>j", opts)
-- keymap("n", "sl", "<C-w>l", opts)
keymap("n", "ss", ":split<Return><C-w>j", opts)
keymap("n", "sv", ":vsplit<Return><C-w>l", opts)
keymap("n", "<leader>sl", ":vertical resize +10<Return>", opts)
keymap("n", "<leader>sh", ":vertical resize -10<Return>", opts)
keymap("n", "<leader>sj", ":horizontal resize +10<Return>", opts)
keymap("n", "<leader>sk", ":horizontal resize -10<Return>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "gb", "<C-^>", opts)

-- Better in file findings
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Terminal
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Don't know what these do lol
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "Q", "<nop>", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)

-- New terminal in a horizontal / vertical / current window
keymap("n", "<leader>th", ":20split | terminal<CR><cmd>startinsert<CR>", opts)
keymap("n", "<leader>tv", ":80vsplit | terminal<CR><cmd>startinsert<CR>", opts)
keymap("n", "<leader>tt", ":terminal<CR><cmd>startinsert<CR>", opts)

-- Custom command to replace :bd and keep windows open
vim.api.nvim_create_user_command("Bd", function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Move to the previous buffer
  vim.cmd("bprevious")

  -- If we are still on the same buffer (meaning it was the last open buffer),
  -- create a new empty one to keep the window open
  if bufnr == vim.api.nvim_get_current_buf() then
    vim.cmd("enew")
  end

  -- Delete the original buffer
  vim.cmd("bdelete " .. bufnr)
end, {})

-- Abbreviate lowercase :bd to call our uppercase :Bd command
vim.cmd("cnoreabbrev <expr> bd getcmdtype() == ':' && getcmdline() == 'bd' ? 'Bd' : 'bd'")

-- Git
keymap("n", "ghd", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "ghr", ":Gitsigns reset_hunk<CR>", opts)
keymap("v", "ghr", ":Gitsigns reset_hunk<CR>", opts)
