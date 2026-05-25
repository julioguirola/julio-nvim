require("nvim-treesitter").install({
	"javascript",
	"lua",
	"typescript",
	"vue",
	"python",
	"go",
	"rust",
	"html",
	"yaml",
	"css",
	"json",
	"gomod",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"javascript",
		"lua",
		"typescript",
		"vue",
		"python",
		"go",
		"rust",
		"html",
		"yaml",
		"css",
		"json",
		"gomod",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
