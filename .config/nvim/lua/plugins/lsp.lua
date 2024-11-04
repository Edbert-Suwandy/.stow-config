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
					'docker_compose_language_service',
					'dockerls',
					'terraformls',
					'bashls',
					'pyright',
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
				capabilites = capabilites,
			})

			lspconfig.docker_compose_language_service.setup({
				capabilites = capabilites,
			})

			lspconfig.dockerls.setup({
				capabilites = capabilites,
			})
			lspconfig.terraformls.setup({
				capabilites = capabilites,
			})
			lspconfig.bashls.setup({
				capabilites = capabilites,
			})
			lspconfig.pyright.setup({
				capabilites = capabilites,
			})
			vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
		end
	},
}
