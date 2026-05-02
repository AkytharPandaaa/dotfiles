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

		local parsers = {
			"angular",
			"arduino",
			"bash",
			"bibtex",
			"c",
			"c_sharp",
			"comment",
			"css",
			"csv",
			"desktop",
			"devicetree",
			"dockerfile",
			"fish",
			"gitignore",
			"gpg",
			"html",
			"hyprlang",
			"json",
			"latex",
			"lua",
			"markdown",
			"passwd",
			"powershell",
			"python",
			"regex",
			"requirements",
			"rust",
			"sql",
			"ssh_config",
			"sway",
			"tmux",
			"udev",
			"unison",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
			"zsh",
		}

		-- highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = parsers,
			callback = function()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"

				-- Optional: configure fold behavior - Initial fold level (0 = all closed, 99 = all open)
				vim.wo.foldlevel = 99 -- Start with all folds open
				-- vim.wo.foldlevelstart = 99 -- Crashes the plugin *shrug*

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.treesitter.start()
			end,
		})

		-- pre-installed language parsers
		treesitter.install(parsers)
	end,
}
