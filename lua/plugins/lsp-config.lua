return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			local mason = require("mason")

			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

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
				ensure_installed = {
					"tsserver",
					"html",
					"clangd",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.prismals.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
