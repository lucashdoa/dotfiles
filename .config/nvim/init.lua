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

-- Set Font
vim.o.guifont = "FiraCode Nerd Font:h14"

-- Set <Space> as leader key
vim.g.mapleader = " "
vim.keymap.set("n", " ", "<Nop>", { noremap = true, silent = true })

-- Use system clipboard (install xclip to work)
vim.opt.clipboard = "unnamedplus"

-- Set identation to two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true }) -- jk to exit insert mode

-- Move lines up and down with Alt + jk
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

-- Show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Format on save with Conform
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Load plugins
require("lazy").setup("plugins")
