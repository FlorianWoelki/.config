function ColorMe(color)
	color = color or "github_dark_dimmed"

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.api.nvim_command("hi ColorColumn guibg=#32363d")
end

ColorMe()
