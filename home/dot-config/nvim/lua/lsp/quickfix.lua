local severity_label = { E = 'error', W = 'warn', I = 'info', N = 'hint' }

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
