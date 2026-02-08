vim.lsp.config['lua-language-server'] = {
	cmd = { 'lua-language-server' },
	filetypes = { "lua" },
	single_file_support = true,
	root = {
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},
	runtime = {
		version = 'LuaJIT',
	},
}

vim.lsp.enable('lua-language-server')
