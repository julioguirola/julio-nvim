vim.g.mapleader = " "

vim.keymap.set("n", "<C-p>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", "viw", { desc = "Select word" })
vim.keymap.set({ "n" }, "<C-a>", "ggVG", { desc = "Select all" })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.scrolloff = 20
vim.opt.sidescrolloff = 20

vim.g.netrw_banner = 0

-- vim.opt.mouse = ""
-- vim.opt.guicursor = ""

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

vim.diagnostic.config({
	virtual_text = true, -- shows inline after the line
	signs = true, -- shows icons in the sign column
	underline = true, -- underlines the problematic code
	update_in_insert = false,
})

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.o.pumblend = 0

vim.keymap.set("n", "<A-k>", ":m.-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m.+1<CR>==")

vim.keymap.set("v", "<A-j>", ":m'>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m'<-2<CR>gv=gv")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { noremap = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
