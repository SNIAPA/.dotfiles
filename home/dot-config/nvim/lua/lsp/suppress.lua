-- Insert #[allow(...)]/#[expect(...)] above the current line for the
-- lint diagnostic reported there (e.g. clippy::missing_panic_doc).
local M = {}

local function diagnostics_on_cursor_line()
	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	local diagnostics = vim.diagnostic.get(0, { lnum = line })

	return vim.tbl_filter(function(d)
		return d.code ~= nil
	end, diagnostics)
end

local function insert_attr(kind, diagnostic)
	local lnum = diagnostic.lnum
	local target = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)[1] or ''
	local indent = target:match('^%s*') or ''
	local attr = string.format('%s#[%s(%s)]', indent, kind, diagnostic.code)

	vim.api.nvim_buf_set_lines(0, lnum, lnum, false, { attr })
end

-- kind: "allow" or "expect"
function M.suppress(kind)
	local diagnostics = diagnostics_on_cursor_line()

	if #diagnostics == 0 then
		vim.notify('No lint diagnostic with a code on this line', vim.log.levels.WARN)
		return
	end

	if #diagnostics == 1 then
		insert_attr(kind, diagnostics[1])
		return
	end

	vim.ui.select(diagnostics, {
		prompt = 'Select diagnostic to suppress',
		format_item = function(d)
			return string.format('%s: %s', d.code, d.message)
		end,
	}, function(choice)
		if choice then
			insert_attr(kind, choice)
		end
	end)
end

return M
