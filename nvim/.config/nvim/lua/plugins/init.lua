return {
	-- NERDTree file explorer
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

	-- colorscheme - catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				-- set flavour
				flavour = "latte",
				transparent_background = true,
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
			})
		end,
	},

	-- colorscheme - custom
	--[[
	{
		"folke/tokyonight.nvim", -- Placeholder, we override everything
		config = function()
			vim.cmd([[
      hi clear
      syntax reset
      set background=dark
      
      " Pure terminal colors on black
      hi Normal guifg=#ffffff guibg=#000000
      hi Comment guifg=#808080
      hi String guifg=#00ff00      " Pure green
      hi Number guifg=#ff0000      " Pure red  
      hi Boolean guifg=#ff0000     " Pure red
      hi Identifier guifg=#00ffff  " Pure cyan
      hi Function guifg=#ffff00    " Pure yellow
      hi Statement guifg=#ff00ff   " Pure magenta
      hi Keyword guifg=#ff00ff     " Pure magenta
      hi Type guifg=#ffff00        " Pure yellow
      hi Special guifg=#ffffff     " Pure white
      hi PreProc guifg=#00ffff     " Pure cyan
      hi Constant guifg=#ff0000    " Pure red
      hi Error guifg=#ffffff guibg=#ff0000
      
      " UI elements
      hi LineNr guifg=#808080 guibg=#000000
      hi Visual guibg=#333333
      hi Search guifg=#000000 guibg=#ffff00
      hi StatusLine guifg=#ffffff guibg=#333333
		end,
	},
  --]]

	-- Mason and LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "omnisharp" },
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- Code formatters
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cs = { "csharpier" },
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
