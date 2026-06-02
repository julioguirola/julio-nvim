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
	"php",
	"blade",
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
		"php",
		"blade",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
