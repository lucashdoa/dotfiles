-- NERDTree file explorer
return {
	{
		"preservim/nerdtree",
		config = function()
			-- Basic NERDTree settings
			vim.g.NERDTreeShowHidden = 1
			vim.g.NERDTreeWinSize = 30

			-- Key mapping to toggle NERDTree
			vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true, silent = true })
		end,
	},
}
