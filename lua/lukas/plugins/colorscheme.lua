return {
	{ -- https://github.com/catppuccin/nvim
		"catppuccin/nvim",
		priority = 1000,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "auto",
				background = { light = "latte", dark = "macchiato" },
				transparent_background = false,
				show_end_of_buffer = true,
				term_colors = false,
				dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
				no_italic = true,
				no_bold = false,
				no_underline = false,
				color_overrides = {},
				default_integrations = true,
				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
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
			vim.cmd([[colorscheme rose-pine-moon]])
		end,
	},
	{ --https://github.com/uloco/bluloco.nvim
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function() end,
	},
	{ -- https://github.com/pauchiner/pastelnight.nvim
		"pauchiner/pastelnight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "rakr/vim-one" }, -- https://github.com/rakr/vim-one
	{ "rose-pine/neovim", name = "rose-pine" }, -- https://github.com/rose-pine/neovim
	{ "perpetuatheme/nvim", name = "perpetua" }, -- https://github.com/perpetuatheme/nvim
}
