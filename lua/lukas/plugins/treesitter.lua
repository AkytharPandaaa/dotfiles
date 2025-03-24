return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			modules = {},
			auto_install = false, -- automatically install missing parsers; set to 'false' if you don't have 'tree-sitter' CLI installed locally
			ignore_install = {},
			sync_install = false, -- install parsers synchronously (only applied to 'ensure_installed')
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"angular",
				"arduino",
				"bash",
				"bibtex",
				"c",
				"c_sharp",
				"cpp",
				"css",
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
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
