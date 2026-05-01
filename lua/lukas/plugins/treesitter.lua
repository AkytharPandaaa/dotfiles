return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter")

		-- highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.treesitter.start()
			end,
		})

		-- pre-installed language parsers
		treesitter.install({
			"angular",
			"arduino",
			"bash",
			"bibtex",
			"c",
			"c_sharp",
			"cpp",
			"css",
			"devicetree",
			"dockerfile",
			"gdscript",
			"gitignore",
			"gpg",
			"graphql",
			"fish",
			"html",
			"javascript",
			"json",
			"kotlin",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"passwd",
			"php",
			"powershell",
			"prisma",
			"python",
			"query",
			"regex",
			"rust",
			"sql",
			"ssh_config",
			"svelte",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})
	end,
}
