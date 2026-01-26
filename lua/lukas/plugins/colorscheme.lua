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
	-- ===========================================================
	{ -- https://github.com/ribru17/bamboo.nvim
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				code_style = {
					comments = { italic = false },
					conditionals = { italic = false },
					namespaces = { italic = false },
					parameters = { italic = false },
				},
			})
		end,
	},
	{ -- https://github.com/sainnhe/edge
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.edge_disable_italic_comment = true
			vim.g.edge_style = "light"
			vim.g.edge_better_performance = true
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
	{ -- https://github.com/projekt0n/github-nvim-theme
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		priority = 1000,
		lazy = false,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = false,
					styles = {
						comments = "NONE",
						functions = "bold",
						keywords = "bold",
						variables = "NONE",
						conditionals = "bold",
						constants = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "bold",
					},
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
	{ -- https://github.com/shaunsingh/nord.nvim
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_italic = false
		end,
	},
	{ -- https://github.com/AlexvZyl/nordic.nvim
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				italic_comments = false,
			})
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
					transparent = true,
				},
			})
		end,
	},
	{ -- https://github.com/sainnhe/sonokai
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_style = "maia"
			vim.g.sonokai_disable_italic_comment = true
			vim.g.sonokai_better_performance = true
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
	{ "mhartington/oceanic-next", priority = 1000 }, -- https://github.com/mhartington/oceanic-next
	{ "Mofiqul/dracula.nvim" }, -- https://github.com/Mofiqul/dracula.nvim
	{ "perpetuatheme/nvim", name = "perpetua" }, -- https://github.com/perpetuatheme/nvim
}
