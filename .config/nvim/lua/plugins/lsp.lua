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
					'rust_analyzer',
					'bashls',
					'tsserver',
					'yamlls',
					"terraformls",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local capabilites = require("cmp_nvim_lsp").default_capabilites
			lspconfig.lua_ls.setup({
				capabilites = capabilites,
			})

			lspconfig.gopls.setup({
				capabilites = capabilites,
			})

			lspconfig.rust_analyzer.setup({
				capabilites = capabilites
			})

			lspconfig.bashls.setup({
				capabilites = capabilites
			})

			lspconfig.tsserver.setup({
				capabilites = capabilites
			})

			lspconfig.yamlls.setup({
				capabilites = capabilites
			})

			lspconfig.terraformls.setup({
				capabilites = capabilites
			})


			vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
		end
	},
}
