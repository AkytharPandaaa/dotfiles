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
				styles = {
					bold = true,
					italic = false,
					transparent = false,
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
}
