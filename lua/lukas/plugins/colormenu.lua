return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			-- add the config here
			themes = {
				{ name = "[dark] TokyoNight Storm", colorscheme = "tokyonight-storm" },
				{ name = "[dark] Pastelnight", colorscheme = "pastelnight" },
				{ name = "[dark] Everforest", colorscheme = "everforest" },
				{ name = "[dark] Rosé Pine Moon", colorscheme = "rose-pine-moon" },
				{ name = "[light] Rosé Pine Dawn", colorscheme = "rose-pine-dawn" },
				{ name = "[light] Material", colorscheme = "material-lighter" },
			},
			livePreview = true, -- Apply theme while picking. Default to true.
		})

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>kt", "<cmd>Themery<cr>", { desc = "use Themery menu to change colorscheme" })
	end,
}
