local M = {}

function M.copy_diagnostic()
	-- Get diagnostics for current line
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics == 0 then
		vim.notify("No diagnostics on current line")
		return
	end

	-- Format the diagnostics similar to how open_float() does it
	local lines = {}
	table.insert(lines, "Diagnostics:")

	for i, diagnostic in ipairs(diagnostics) do
		local severity = vim.diagnostic.severity[diagnostic.severity]
		local prefix = string.format("%d. ", i)
		local message = diagnostic.message

		-- Add source if available
		if diagnostic.source then
			message = string.format("[%s] %s", diagnostic.source, message)
		end

		table.insert(lines, prefix .. message)
	end

	local text = table.concat(lines, "\n")
	vim.fn.setreg("+", text)
	vim.notify("Diagnostic float content copied to clipboard")
end

return M
