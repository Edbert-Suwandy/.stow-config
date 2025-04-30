return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"docker_compose_language_service",
					"dockerls",
					"terraformls",
					"bashls",
					"pyright",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				-- Format on save
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end

				-- Keymaps
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
			end

			-- Setup all LSPs
			local servers = {
				"lua_ls",
				"gopls",
				"docker_compose_language_service",
				"dockerls",
				"terraformls",
				"bashls",
				"pyright",
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
		end
	},
}
