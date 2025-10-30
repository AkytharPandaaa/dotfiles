return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		local severity_icons = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "-",
			[vim.diagnostic.severity.INFO] = " ",
		}
		vim.diagnostic.config({
			signs = {
				text = severity_icons, -- text before line number
				linehl = { -- line highlighting
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
				},
				numhl = { -- number highlighting
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		})

		-- configuration autocompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- angularls
		vim.lsp.config("angularls", {
			cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				"../..,?/node_modules",
				"--ngProbeLocations",
				"../../@angular/language-server/node_modules,?/node_modules/@angular/language-server/node_modules",
				"--angularCoreVersion",
				"",
			},
			filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
			root_markers = { "angular.json", "nx.json" },
		})

		-- ansiblels
		vim.lsp.config("ansiblels", {
			cmd = { "ansible-language-server", "--stdio" },
			filetypes = { "yaml.ansible" },
			root_markers = { "ansible.cfg", ".ansible-lint" },
			settings = {
				ansible = {
					ansible = {
						path = "ansible",
					},
					executionEnvironment = {
						enabled = false,
					},
					python = {
						interpreterPath = "python",
					},
					validation = {
						enabled = true,
						lint = {
							enabled = true,
							path = "ansible-lint",
						},
					},
				},
			},
		})

		-- arduino_language_server
		vim.lsp.config("arduino_language_server", {
			capabilities = capabilities,
			cmd = { "arduino-language-server" },
			filetypes = { "arduino" },
		})

		-- asm_lsp
		vim.lsp.config("asm_lsp", {
			cmd = { "asm-lsp" },
			filetypes = { "asm", "vmasm" },
			root_markers = { ".asm-lsp.toml", ".git" },
		})

		-- astro
		vim.lsp.config("astro", {
			cmd = { "astro-ls", "--stdio" },
			init_options = { typescript = {} },
			root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
		})

		-- bashls
		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh" },
			root_markers = { ".git" },
			settings = {
				bashIde = {
					globPattern = "*@(.sh|.inc|.bash|.command)",
				},
			},
		})

		-- cmake
		vim.lsp.config("cmake", {
			cmd = { "cmake-language-server" },
			filetypes = { "cmake" },
			init_options = {
				buildDirectory = "build",
			},
			root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
		})

		-- cssls
		vim.lsp.config("cssls", {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less" },
			init_options = {
				provideFormatter = true,
			},
			root_markers = { "package.json", ".git" },
			settings = {
				css = {
					validate = true,
				},
				less = {
					validate = true,
				},
				scss = {
					validate = true,
				},
			},
		})

		-- csharp_ls
		vim.lsp.config("csharp_ls", {
			cmd = { "csharp-ls" },
			filetypes = { "cs" },
			init_options = { AutomaticWorkspaceInit = true },
		})

		-- docker_compose_language_service
		vim.lsp.config("docker_compose_language_service", {
			cmd = { "docker-compose-langserver", "--stdio" },
			filetypes = { "yaml.docker-compose" },
			root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
		})

		-- dockerls
		vim.lsp.config("dockerls", {
			cmd = { "docker-langserver", "--stdio" },
			filetypes = { "dockerfile" },
			root_markers = { "Dockerfile" },
		})

		-- emmet_ls
		vim.lsp.config("emmet_ls", {
			cmd = { "emmet-ls", "--stdio" },
			capabilities = capabilities,
			filetypes = {
				"astro",
				"css",
				"eruby",
				"html",
				"htmldjango",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"svelte",
				"typescriptreact",
				"vue",
				"htmlangular",
			},
			root_markers = { ".git" },
		})

		---		-- fish_lsp
		---		vim.lsp.config("fish_lsp", {
		---			cmd = { "fish-lsp", "start" },
		---			cmd_env = { fish_lsp_show_client_popups = false },
		---			filetypes = { "fish" },
		---			root_markers = { ".git" },
		---		})

		-- graphql
		vim.lsp.config("graphql", {
			cmd = { "graphql-lsp", "server", "-m", "stream" },
			capabilities = capabilities,
			filetypes = { "graphql", "gpl", "svelte", "typescriptreact", "javascriptreact" },
			root_dir = { ".graphqlrc*", ".graphql.config.*", "graphql.config.*" },
		})

		-- harper_ls
		vim.lsp.config("harper_ls", {
			cmd = { "harper-ls", "--stdio" },
			filetypes = {
				"c",
				"cpp",
				"cs",
				"gitcommit",
				"go",
				"html",
				"java",
				"javascript",
				"lua",
				"markdown",
				"nix",
				"python",
				"ruby",
				"rust",
				"swift",
				"toml",
				"typescript",
				"typescriptreact",
				"haskell",
				"cmake",
				"typst",
				"php",
				"dart",
			},
			root_markers = { ".git" },
		})

		-- html
		vim.lsp.config("html", {
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "templ" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			root_markers = { "package.json", ".git" },
			settings = {},
		})

		-- hyprls
		vim.lsp.config("hyprls", {
			cmd = { "hyprls", "--stdio" },
			filetypes = { "hyprlang" },
			root_markers = { ".git" },
		})

		-- jsonls
		vim.lsp.config("jsonls", {
			cmd = { "vscode-json-language-server", "--stdio" },
			filetypes = { "json", "jsonc" },
			init_options = {
				provideFormatter = true,
			},
			root_markers = { ".git" },
		})

		---		-- lsp_ai
		---		vim.lsp.config("lsp_ai", {
		---			cmd = { "lsp-ai" },
		---			filetypes = {},
		---			init_options = {
		---				memory = {
		---					file_store = vim.empty_dict(),
		---				},
		---				models = vim.empty_dict(),
		---			},
		---		})

		-- ltex_plus
		vim.lsp.config("ltex_plus", {
			cmd = { "ltex-ls-plus" },
			filetypes = {
				"bib",
				"context",
				"gitcommit",
				"html",
				"markdown",
				"org",
				"pandoc",
				"plaintex",
				"quarto",
				"mail",
				"mdx",
				"rmd",
				"rnoweb",
				"rst",
				"tex",
				"text",
				"typst",
				"xhtml",
			},
			settings = {
				ltex = {
					enabled = {
						"bib",
						"context",
						"gitcommit",
						"html",
						"latex",
						"mail",
						"markdown",
						"mdx",
						"org",
						"pandoc",
						"plaintex",
						"quarto",
						"rmd",
						"rnoweb",
						"rst",
						"tex",
						"text",
						"typst",
						"xhtml",
					},
					language = { "de-DE" },
				},
			},
		})

		-- lua_ls
		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths
							-- here.
							-- '${3rd}/luv/library'
							-- '${3rd}/busted/library'
						},
					},
				})
			end,
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server reconize "vim" global
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})

		-- millet
		vim.lsp.config("millet", {
			cmd = { "millet" },
			filetypes = { "sml" },
			root_markers = { "millet.toml" },
		})

		-- omnisharp
		vim.lsp.config("omnisharp", {
			capabilities = capabilities,
			cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
			--	enable_import_completion = true,
			--	organize_imports_on_format = true,
			--	enable_roslyn_analyzers = true,
			root_dir = function()
				return vim.fn.getcwd()
			end,

			-- root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" },
			--			settings = {
			--				FormattingOptions = {
			--					EnableEditorConfigSupport = true,
			--				},
			--				MsBuild = {},
			--				RenameOptions = {},
			--				RoslynExtensionsOptions = {},
			--				Sdk = {
			--					IncludePrereleases = true,
			--				},
			--			},
		})

		-- openscad_lsp
		vim.lsp.config("openscad_lsp", {
			cmd = { "openscad-lsp", "--stdio" },
			filetypes = { "openscad" },
			{ ".git" },
		})

		-- postgres_lsp
		vim.lsp.config("postgres_lsp", {
			cmd = { "postgres-language-server", "lsp-proxy" },
			filetypes = { "sql" },
			root_markers = { "postgres-language-server.jsonc" },
		})

		-- powershell_es
		vim.lsp.config("powershell_es", {
			filetypes = { "ps1" },
			root_markers = { "PSScriptAnalyzerSettings.psd1", ".git" },
		})

		-- prismals
		vim.lsp.config("prismals", {
			cmd = { "prisma-language-server", "--stdio" },
			filetypes = { "prisma" },
			root_markers = { ".git", "package.json" },
			settings = { prisma = { prismaFmtBinPath = "" } },
		})

		-- pyright
		vim.lsp.config("pyright", { -- on_attach possible
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = {
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"pyrightconfig.json",
				".git",
			},
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		-- svelte
		vim.lsp.config("svelte", {
			cmd = { "svelteserver", "--stdio" },
			filetypes = { "svelte" },
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						-- Here use ctx.match instead of ctx.file
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
			root_markers = { "package.json", ".git" },
		})

		-- tailwindcss
		vim.lsp.config("tailwindcss", {
			cmd = { "tailwindcss-language-server", "--stdio" },
			filetypes = {
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"clojure",
				"django-html",
				"htmldjango",
				"edge",
				"eelixir",
				"elixir",
				"ejs",
				"erb",
				"eruby",
				"gohtml",
				"gohtmltmpl",
				"haml",
				"handlebars",
				"hbs",
				"html",
				"htmlangular",
				"html-eex",
				"heex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte",
				"templ",
			},
			settings = {
				tailwindCSS = {
					classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
					includeLanguages = {
						eelixir = "html-eex",
						eruby = "erb",
						htmlangular = "html",
						templ = "html",
					},
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidConfigPath = "error",
						invalidScreen = "error",
						invalidTailwindDirective = "error",
						invalidVariant = "error",
						recommendedVariantOrder = "warning",
					},
					validate = true,
				},
			},
			workspace_required = true,
		})

		-- vtsls
		vim.lsp.config("vtsls", {
			cmd = { "vtsls", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
		})

		-- yamlls
		vim.lsp.config("yamlls", {
			cmd = { "yaml-language-server", "--stdio" },
			filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
			root_markers = { ".git" },
			settings = {
				redhat = {
					telemetry = {
						enabled = false,
					},
				},
			},
		})
	end,
}
