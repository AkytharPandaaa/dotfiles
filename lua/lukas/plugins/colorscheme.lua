return {
	{ -- https://github.com/catppuccin/nvim
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				no_italic = true,
				integrations = {
					alpha = true,
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					rainbow_delimiters = true,
					telescope = { enabled = true, style = "nvchad" },
					treesitter = true,
					notify = true,
					mini = { enabled = true, indentscope_color = "" },
					which_key = true,
				},
			})
		end,
	},
	{ -- https://github.com/sainnhe/everforest
		"sainnhe/everforest",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_disable_italic_comment = true
			vim.g.everforest_better_performance = true
		end,
	},
	{ -- https://github.com/pauchiner/pastelnight.nvim
		"pauchiner/pastelnight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("pastelnight").setup({
				style = "default",
				styles = {
					comments = { italic = false },
					keyword = { italic = false },
				},
			})
		end,
	},
	{ -- https://github.com/rose-pine/neovim
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon or dawn
				dark_variant = "moon", -- main, moon or dawn

				enable = {
					terminal = true,
					migrations = true, -- handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparent = false, -- not working in moon on linux with kitty
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},
			})
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
	{ -- https://github.com/folke/tokyonight.nvim
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					functions = { italic = false },
					comments = { italic = false },
				},
			})
		end,
	},
	{ "marko-cerovac/material.nvim" }, -- https://github.com/marko-cerovac/material.nvim
}
