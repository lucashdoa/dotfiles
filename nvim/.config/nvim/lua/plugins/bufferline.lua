return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers", -- Buffer tabs (what you want)
				show_buffer_close_icons = true,
				show_close_icon = true,
				always_show_bufferline = true,
			},
		},
	},
}
