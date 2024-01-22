local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local function normalize_path(path)
	return path:gsub("\\", "/")
end

local function normalize_cwd()
	return normalize_path(vim.loop.cwd()) .. "/"
end

local function is_subdirectory(cwd, path)
	return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

local function split_filepath(path)
	local normalized_path = normalize_path(path)
	local normalized_cwd = normalize_cwd()
	local filename = normalized_path:match("[^/]+$")

	if is_subdirectory(normalized_cwd, normalized_path) then
		local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
		return stripped_path, filename
	else
		local stripped_path = normalized_path:sub(1, -(#filename + 1))
		return stripped_path, filename
	end
end

local function path_display(_, path)
	local stripped_path, filename = split_filepath(path)
	if filename == stripped_path or stripped_path == "" then
		return filename
	end
	return string.format("%s ~ %s", filename, stripped_path)
end

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				width = { padding = 0 },
				height = { padding = 0 },
				preview_width = 0.5,
			},
		},
		path_display = path_display,
	},
})
