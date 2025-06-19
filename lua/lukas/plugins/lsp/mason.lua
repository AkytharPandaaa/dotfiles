return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
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
				"angularls",
				"ansiblels",
				"arduino_language_server",
				"asm_lsp",
				"astro",
				"bashls",
				"cmake",
				"csharp_ls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"emmet_ls",
				"graphql",
				"harper_ls",
				"html",
				"hyprls",
				"jsonls",
				"ltex_plus",
				"lua_ls",
				"millet",
				"omnisharp",
				"openscad_lsp",
				"postgres_lsp",
				"powershell_es",
				"prismals",
				"pyright",
				"svelte",
				"tailwindcss",
				"vtsls",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"ast-grep", -- c, java, c#, formatter
				"autopep8", -- python formatter
				"black", -- python formatter
				"eslint_d", -- js linter
				"isort", -- python formatter
				"prettier", -- prettier formatter
				"pylint", -- python linter
				"shfmt", -- sh formatter
				"stylua", -- lua formatter
				"tex-fmt", -- latex formatter
			},
			auto_update = true, -- default: false, automatic tool updates
			run_on_start = true, -- default: true, install/update on startup
			start_delay = 3000, -- default: 0, wait x milliseconds before starting installation/updates
			debounce_hours = 2, -- default: nil, wait at least x hours between updates
		})
	end,
}
