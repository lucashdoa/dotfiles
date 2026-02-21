return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
				}
			})
		end,
	},
}
