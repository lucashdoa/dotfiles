-- Set Font
vim.o.guifont = "CaskadyaCove Nerd Font:h14"

-- Set <Space> as leader key
vim.keymap.set("n", " ", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Use system clipboard (install xclip to work)
vim.opt.clipboard = "unnamedplus"

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true }) -- jk to exit insert mode

-- Move lines up and down with Alt + jk
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })

-- Clear search
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Show identation space
vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ", -- Show tabs as arrows
	space = "·", -- Show spaces as dots
	trail = "•", -- Show trailing spaces
	extends = "▶", -- Show when line extends beyond screen
	precedes = "◀", -- Show when line precedes screen
	nbsp = "␣", -- Show non-breaking spaces
}

-- Optional: Set colors for whitespace characters
vim.cmd([[
  highlight Whitespace guifg=#3c3836 ctermfg=237
  highlight SpecialKey guifg=#3c3836 ctermfg=237
]])

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Copy diagnostics to clipboard
vim.keymap.set("n", "<leader>zy", function()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local buf = vim.diagnostic.open_float()
	if not buf then
		vim.notify(("No diagnostics on line %s"):format(line), vim.log.levels.ERROR)
		return
	end

	local lines = vim.api.nvim_buf_get_lines(buf, 1, -1, true)

	local content = '"' .. table.concat(lines, "\n") .. '"'

	content = content:gsub('"', "'")
	content = content:gsub("`", "'")

	if vim.fn.setreg("+", content) ~= 0 then
		vim.notify(("An error happened while trying to copy the diagnostics on line %s"):format(line))
		return
	end

	vim.notify(([[Diagnostics from line %s copied to clipboard.

%s]]):format(line, vim.fn.getreg("+")))
end, { desc = "Copy current line diagnostics" })

-- Set identation to two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Format on save with Conform
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
