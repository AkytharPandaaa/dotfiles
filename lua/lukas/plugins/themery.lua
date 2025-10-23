return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{ name = "[dark] Dracula", colorscheme = "dracula" },
				{ name = "[dark] Evergarden Spring", colorscheme = "evergarden-spring" },
				{ name = "[dark] Evergarden Fall", colorscheme = "evergarden-fall" },
				{ name = "[dark] Kanagawa Wave", colorscheme = "kanagawa-wave" },
				{ name = "[dark] Makurai Autumn", colorscheme = "makurai_autumn" },
				{ name = "[dark] Night Owl", colorscheme = "night-owl" },
				{ name = "[dark] Nordic", colorscheme = "nordic" },
				{ name = "[dark] OceanicNext", colorscheme = "OceanicNext" },
				{ name = "[dark] Pastelnight", colorscheme = "pastelnight" },
				{ name = "[dark] Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "[dark] TokyoNight Moon", colorscheme = "tokyonight-moon" },
				{ name = "[dark] TokyoNight Storm", colorscheme = "tokyonight-storm" },
				{ name = "[dark] Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "[dark] Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
				{ name = "[light] Catppuccin Latte", colorscheme = "catppuccin-latte" },
				{ name = "[light] Evergarden Summer", colorscheme = "evergarden-summer" },
				{ name = "[light] Makurai", colorscheme = "makurai_light" },
				{ name = "[light] Nord", colorscheme = "nord" },
				{ name = "[light] OceanicNext", colorscheme = "OceanicNextLight" },
				{ name = "[light] Perpetua", colorscheme = "perpetua-light" },
				{ name = "[light] Rosé Pine Dawn", colorscheme = "rose-pine-dawn" },
				{ name = "[light] TokyoNight", colorscheme = "tokyonight-day" },
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>kt", "<cmd>Themery<cr>", { desc = "use Themery menu to change colorscheme" })
	end,
}
