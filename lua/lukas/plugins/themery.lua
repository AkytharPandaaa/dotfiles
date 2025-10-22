return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
				{ name = "Dracula", colorscheme = "dracula" },
				{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
				{ name = "Night Owl", colorscheme = "night-owl" },
				{ name = "Pastelnight", colorscheme = "pastelnight" },
				{ name = "Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "Makurai (Autumn)", colorscheme = "makurai_autumn" },
				{ name = "Everforest", colorscheme = "everforest" },
				{ name = "Nordic", colorscheme = "nordic" },
				{ name = "Catppuccin Latte (light)", colorscheme = "catppuccin-latte" },
				{ name = "Rosé Pine Dawn (light)", colorscheme = "rose-pine-dawn" },
				{ name = "Makurai (light)", colorscheme = "makurai_light" },
				{ name = "Perpetua (light)", colorscheme = "perpetua-light" },
				{ name = "Nord (light)", colorscheme = "nord" },
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>kt", "<cmd>Themery<cr>", { desc = "use Themery menu to change colorscheme" })
	end,
}
