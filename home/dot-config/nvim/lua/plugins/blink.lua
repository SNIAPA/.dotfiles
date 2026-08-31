return {
	'saghen/blink.cmp',
	version = '1.*',
	dependencies = { 'rafamadriz/friendly-snippets' },
	opts = {
		keymap = {
			preset = 'default',
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-l>'] = { 'select_and_accept', 'fallback' },
		},
		appearance = { nerd_font_variant = 'mono' },
		completion = {
			ghost_text = { enabled = false },
			documentation = { auto_show = true },
			menu = { border = 'none' },
		},
		signature = { enabled = true, window = { border = 'none' } },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'minuet' },
			providers = {
				minuet = {
					name = 'minuet',
					module = 'minuet.blink',
					async = true,
					timeout_ms = 3000,
					score_offset = 50,
				},
			},
		},
	},
}
