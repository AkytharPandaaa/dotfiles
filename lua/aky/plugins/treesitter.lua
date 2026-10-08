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

		-- additional parser: openscad
		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").openscad = {
					install_info = {
						url = "https://github.com/openscad/tree-sitter-openscad",
						revision = HEAD, -- commit hash for revision to check out; HEAD if missing
						-- optional entries:
						-- location = 'parser', -- only needed if the parser is in subdirectory of a "monorepo"
						-- generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
						-- generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
						-- queries = 'queries/neovim', -- also install queries from given directory
					},
				}
			end,
		})

		-- pre-installed language parsers
		treesitter.install(parsers)
	end,
}
