-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load utils (custom functions)
local diagnostics = require("utils.diagnostics")
vim.keymap.set("n", "<leader>dc", diagnostics.copy_diagnostic, { desc = "Copy diagnostic to clipboard" })

-- Load Vimrc
require("vimrc")
-- Load plugins
require("lazy").setup("plugins")
