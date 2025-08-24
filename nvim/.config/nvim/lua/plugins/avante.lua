return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		opts = {
			-- Configure your AI provider
			provider = "claude", -- or "openai", "azure", etc.
			-- MCP server configuration
			mcp = {
				enabled = true,
				servers = {
					{
						name = "your-mcp-server",
						command = "path/to/your/mcp/server",
						args = {},
					},
				},
			},
		},
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
}
