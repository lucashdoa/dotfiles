return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cs = { "csharpier" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
				},
				formatters = {
					csharpier = {
						command = "csharpier",
						args = function(self, ctx)
							return { "format", ctx.filename }
						end,
						stdin = false,
					},
				},
			})
		end,
	},
}
