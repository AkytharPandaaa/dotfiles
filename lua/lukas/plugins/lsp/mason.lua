return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			automatic_installation = {},
			ensure_installed = {
				"vtsls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"asm_lsp",
				"bashls",
				"harper_ls",
				"cmake",
				"dockerls",
				"jsonls",
				"ltex",
				"openscad_lsp",
				"powershell_es",
				"millet",
				"yamlls",
				"angularls",
				"ansiblels",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"shfmt", -- sh formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"ast-grep", -- c, java, c#, formatter
				"autopep8", -- python formatter
				"tex-fmt", -- latex formatter
			},
		})
	end,
}
