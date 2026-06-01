local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		fields = { "abbr", "kind" },
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config["rust_analyzer"] = {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.toml", "rust-project.json" },
	filetypes = { "rust" },
	capabilities = capabilities,
}

vim.lsp.enable("rust_analyzer")

vim.lsp.config["pylsp"] = {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "requirements.txt" },
	capabilities = capabilities,
}

vim.lsp.enable("pylsp")

vim.lsp.config["pyright"] = {
	cmd = { "pyright-langserver" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"requirements.txt",
		".git",
	},
	capabilities = capabilities,
}

vim.lsp.enable("pyright")

vim.lsp.config["ts_ls"] = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "tsconfig.node.json", "tsconfig.app.json" },
	capabilities = capabilities,
}

vim.lsp.enable("ts_ls")

vim.lsp.config["vue_lsp"] = {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "tsconfig.node.json", "tsconfig.app.json" },
	capabilities = capabilities,
}

vim.lsp.enable("vue_lsp")

vim.lsp.config["jsonls"] = {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true, allowTrailingCommas = true },
		},
	},
	capabilities = capabilities,
}

vim.lsp.enable("jsonls")

vim.lsp.config["gopls"] = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.mod", ".git" },
	capabilities = capabilities,
}

vim.lsp.enable("gopls")

vim.lsp.config["ymlsp"] = {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	capabilities = capabilities,
}

vim.lsp.enable("ymlsp")

vim.lsp.config["tw"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
		"package.json",
		".git",
	},
	capabilities = capabilities,
}

vim.lsp.enable("tw")

vim.lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luarc.yaml",
		".luarc.yml",
		".git",
	},
	capabilities = capabilities,
}

vim.lsp.enable("lua_ls")

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettier", stop_after_first = true },
		typescript = { "prettier", stop_after_first = true },
		json = { "prettier", stop_after_first = true },
		vue = { "prettier", stop_after_first = true },
		go = { "gofmt", lsp_format = "fallback" },
	},
	formatters = {
		prettier = {
			command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
		},
	},
})

require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
