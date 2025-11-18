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
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end,
	},
	{ -- https://github.com/ribru17/bamboo.nvim
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				toggle_style_list = { "vulgaris", "light" },

				code_style = {
					comments = { italic = false },
					conditionals = { italic = false },
					namespaces = { italic = false },
					parameters = { italic = false },
				},
			})
		end,
	},
	{ -- https://github.com/Skardyy/makurai-nvim
		"Skardyy/makurai-nvim",
		config = function()
			-- you don't have to call setup
			require("makurai").setup({
				transparent = false, -- removes the bg color
				bordered = false, -- removes the bg color from floats/popups
				increase_contrast = false, -- only changes the line number and active line number for now.
			})
		end,
	},
	{ "everviolet/nvim", name = "evergarden", priority = 1000 }, -- https://github.com/everviolet/nvim
	{ "mhartington/oceanic-next", priority = 1000 }, -- https://github.com/mhartington/oceanic-next
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 }, -- https://github.com/folke/tokyonight.nvim
	{ "pauchiner/pastelnight.nvim", lazy = false, priority = 1000 }, -- https://github.com/pauchiner/pastelnight.nvim
	{ "rebelot/kanagawa.nvim" }, -- https://github.com/rebelot/kanagawa.nvim
	{ "shaunsingh/nord.nvim" }, -- https://github.com/shaunsingh/nord.nvim
	{ "Mofiqul/dracula.nvim" }, -- https://github.com/Mofiqul/dracula.nvim
	{ "oxfist/night-owl.nvim", lazy = false, priority = 1000 }, -- https://github.com/oxfist/night-owl.nvim
	{ "AlexvZyl/nordic.nvim", lazy = false, priority = 1000 }, -- https://github.com/AlexvZyl/nordic.nvim
	{ "perpetuatheme/nvim", name = "perpetua" }, -- https://github.com/perpetuatheme/nvim
	{ "rose-pine/neovim", name = "rose-pine" }, -- https://github.com/rose-pine/neovim
}
