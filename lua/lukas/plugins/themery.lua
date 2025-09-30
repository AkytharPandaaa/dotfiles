return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "Dracula", colorscheme = "dracula" },
				{ name = "Everforest", colorscheme = "everforest" },
				{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
				{ name = "Night Owl", colorscheme = "night-owl" },
				{ name = "Nordic", colorscheme = "nordic" },
				{ name = "Pastelnight", colorscheme = "pastelnight" },
				{ name = "Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "Rosé Pine", colorscheme = "rose-pine-main" },
				{ name = "Catppuccin Latte (light)", colorscheme = "catppuccin-latte" },
				{ name = "Makurai (light)", colorscheme = "makurai_light" },
				{ name = "Nord (light)", colorscheme = "nord" },
				{ name = "Perpetua (light)", colorscheme = "perpetua-light" },
				{ name = "Rosé Pine Dawn (light)", colorscheme = "rose-pine-dawn" },
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>kt", "<cmd>Themery<cr>", { desc = "use Themery menu to change colorscheme" })
	end,
}
