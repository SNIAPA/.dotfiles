vim.lsp.config['lua-language-server'] = {
	cmd = { 'lua-language-server' },
	filetypes = { "lua" },
	root_markers = {
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				checkThirdParty = false,
			},
		},
	},
}

vim.lsp.enable('lua-language-server')
