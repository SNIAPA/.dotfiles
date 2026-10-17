local M = {}

local severity_label = { E = 'error', W = 'warn', I = 'info', N = 'hint' }
local list_title = 'Diagnostics'

-- Replaces the quickfix list with all diagnostics. Each entry keeps the
-- server's rendered (ANSI colored) message in user_data when it provides one.
function M.set_diagnostics()
	local diagnostics = vim.diagnostic.get()
	local rendered = {}
	for _, d in ipairs(diagnostics) do
		local data = d.user_data and d.user_data.lsp and d.user_data.lsp.data
		if type(data) == 'table' and type(data.rendered) == 'string' then
			rendered[string.format('%d:%d:%d:%s', d.bufnr, d.lnum + 1, (d.col or 0) + 1, d.message)] = data.rendered
		end
	end

	local items = vim.diagnostic.toqflist(diagnostics)
	for _, item in ipairs(items) do
		item.user_data = rendered[string.format('%d:%d:%d:%s', item.bufnr, item.lnum, item.col or 1, item.text)]
	end

	local replace = vim.fn.getqflist({ title = 0 }).title == list_title
	vim.fn.setqflist({}, replace and 'r' or ' ', { title = list_title, items = items })
end

-- Shows the rendered message of the entry under the cursor in a floating
-- terminal so the ANSI colors are displayed.
local function preview_rendered()
	local idx = vim.fn.line('.')
	local item = vim.fn.getqflist({ items = 0 }).items[idx]
	local text = item and item.user_data
	if type(text) ~= 'string' or text == '' then
		vim.notify('No rendered message for this entry', vim.log.levels.INFO)
		return
	end

	text = text:gsub('%s+$', '')
	local lines = vim.split(text, '\n', { plain = true })
	local width = 0
	for _, l in ipairs(lines) do
		width = math.max(width, #l:gsub('\27%[[%d;]*m', ''))
	end

	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = math.min(width + 2, vim.o.columns - 4),
		height = math.min(#lines, vim.o.lines - 6),
		row = 2,
		col = 2,
		style = 'minimal',
		border = 'rounded',
		title = ' ' .. (severity_label[item.type] or 'info') .. ' ',
	})
	local chan = vim.api.nvim_open_term(buf, {})
	vim.api.nvim_chan_send(chan, (text:gsub('\n', '\r\n')))
	local close = function() vim.api.nvim_win_close(win, true) end
	vim.keymap.set('n', 'q', close, { buffer = buf })
	vim.keymap.set('n', '<Esc>', close, { buffer = buf })
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'qf',
	callback = function(args)
		vim.keymap.set('n', 'K', preview_rendered, { buffer = args.buf, desc = 'Show rendered diagnostic' })
	end,
})

-- Renders each entry as `path:line:col  severity  first message line`.
function _G.lsp_quickfix_text(info)
	local items
	if info.quickfix == 1 then
		items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	else
		items = vim.fn.getloclist(info.winid, { id = info.id, items = 0 }).items
	end

	local lines = {}
	for i = info.start_idx, info.end_idx do
		local item = items[i]
		local text = (item.text or ''):gsub('^%s+', '')
		local first, extra = text:match('^([^\n]*)\n?(.*)$')
		if extra ~= '' then
			first = first .. ' [+]'
		end
		if item.valid == 1 and item.bufnr > 0 then
			local name = vim.fn.fnamemodify(vim.fn.bufname(item.bufnr), ':.')
			local sev = severity_label[item.type] or 'info'
			lines[#lines + 1] = string.format('%s:%d:%d  %-5s  %s', name, item.lnum, item.col, sev, first)
		else
			lines[#lines + 1] = first
		end
	end
	return lines
end

vim.o.quickfixtextfunc = 'v:lua.lsp_quickfix_text'

vim.api.nvim_create_autocmd('Syntax', {
	pattern = 'qf',
	callback = function()
		vim.cmd [[
			syntax clear
			unlet! b:current_syntax
			syntax include @qfRust syntax/rust.vim
			unlet! b:current_syntax

			syntax match qfPath    /^[^:]\+\ze:\d\+:\d\+\s/ nextgroup=qfLnum
			syntax match qfLnum    /:\d\+:\d\+/ contained
			syntax match qfError   /\s\zserror\ze\s\s/
			syntax match qfWarn    /\s\zswarn\ze\s\s\s/
			syntax match qfInfo    /\s\zsinfo\ze\s\s\s/
			syntax match qfHint    /\s\zshint\ze\s\s\s/
			syntax match qfMore    /\[+\]$/ contained
			syntax match qfLabel   /\<\(note\|help\|warning\|error\)\ze:/ contained
			syntax region qfCode   matchgroup=qfTick start=/`/ end=/`/ oneline contained contains=@qfRust
			syntax match qfBody    /\(\(error\|warn \|info \|hint \)\s\s\)\@<=.*$/ contains=qfCode,qfLabel,qfMore

			highlight default link qfPath  Directory
			highlight default link qfLnum  LineNr
			highlight default link qfError DiagnosticError
			highlight default link qfWarn  DiagnosticWarn
			highlight default link qfInfo  DiagnosticInfo
			highlight default link qfHint  DiagnosticHint
			highlight default link qfMore  Comment
			highlight default link qfLabel Title
			highlight default link qfTick  Comment
		]]
		vim.b.current_syntax = 'qf'
	end,
})
return M
