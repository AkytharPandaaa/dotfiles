return {
	"mvllow/modes.nvim",
	tag = "v0.3.0",
	config = function()
		require("modes").setup({
			colors = {
				bg = "", -- Optional bg param, defaults to Normal hl group
				copy = "#f6c177",
				change = "#eb6f92",
				delete = "#eb6f92",
				format = "#ea9a97",
				insert = "#9ccfd8",
				replace = "#3e8fb0",
				select = "#c4a7e7",
				visual = "#c4a7e7",
			},

			-- Set opacity for cursorline and number background
			line_opacity = 0.15,

			-- Enable cursor highlights
			set_cursor = true,

			-- Enable cursorline initially, and disable cursorline for inactive windows
			-- or ignored filetypes
			set_cursorline = true,

			-- Enable line number highlights to match cursorline
			set_number = true,

			-- Enable sign column highlights to match cursorline
			set_signcolumn = true,

			-- Disable modes highlights for specified filetypes
			-- or enable with prefix "!" if otherwise disabled (please PR common patterns)
			-- Can also be a function fun():boolean that disables modes highlights when true
			ignore = { "NvimTree", "TelescopePrompt", "!minifiles" },
		})
	end,
}
