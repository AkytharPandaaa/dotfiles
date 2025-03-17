return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	versions = "*",
	opts = {
		options = {
			mode = "tabs", -- or buffers
			separator_style = "slant",
			-- 			custom_areas = {
			-- 				right = function()
			-- 					local result = {}
			-- 					local seve = vim.diagnostic.severity
			-- 					local info = #vim.diagnostic.get(0, { severity = seve.INFO })
			-- 					local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
			--
			-- 					if error ~= 0 then
			-- 						table.insert(result, { text = "ERROR" .. error, link = "DiagnosticError" })
			-- 					end
			--
			-- 					if info ~= 0 then
			-- 						table.insert(result, { text = "INFO" .. info, link = "DiagnosticInfo" })
			-- 					end
			-- 				end,
			-- 			},
		},
	},
}
