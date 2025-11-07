return { -- https://github.com/NeogitOrg/neogit
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	-- hotkeys
	keys = {
		{ "<leader>ng", "<cmd>Neogit<cr>", desc = "Open NeoGit" },
	},
}
