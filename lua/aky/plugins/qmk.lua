return {
	"codethread/qmk.nvim",
	config = function()
		---@type qmk.UserConfig
		require("qmk").setup({
			name = "LAYOUT_pandawings",
			layout = {
				"_ x x x x x _ _ _ x x x x x _",
				"x x x x x x _ _ _ x x x x x x",
				"x x x x x x _ _ _ x x x x x x",
				"_ _ _ _ x x x _ x x x _ _ _ _",
			},
			variant = "zmk",
			auto_format_pattern = { "*keymap.c", "*.keymap" },
			comment_preview = { position = "top" },
		})
	end,
}
