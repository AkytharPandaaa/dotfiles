return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{ name = "[dark] TokyoNight Storm", colorscheme = "tokyonight-storm" },
				{ name = "[dark] Terafox", colorscheme = "terafox" },
				{ name = "[dark] Carbonfox", colorscheme = "carbonfox" },
				{ name = "[dark] Cyberpunk", colorscheme = "cyberpunk" },
				{ name = "[dark] Everforest", colorscheme = "everforest" },
				{ name = "[dark] Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "[dark] Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "[light] Rosé Pine Dawn", colorscheme = "rose-pine-dawn" },
				{ name = "[light] Catppuccin Latte", colorscheme = "catppuccin-latte" },
				{ name = "[light] Edge", colorscheme = "edge" },
				{ name = "[light] Everforest", colorscheme = "everforest" },
				{ name = "[light] Solarized", colorscheme = "solarized" },
				{ name = "[light] Dayfox", colorscheme = "dayfox" },
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>kt", "<cmd>Themery<cr>", { desc = "use Themery menu to change colorscheme" })
	end,
}
