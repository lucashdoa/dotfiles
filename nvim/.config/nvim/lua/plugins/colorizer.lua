return {
	{
		"norcalli/nvim-colorizer.lua",
		opts = { names = true },
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
			})
		end,
	},
}
