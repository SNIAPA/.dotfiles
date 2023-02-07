require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",

  sync_install = false,

  auto_install = true,

	indent = {
		enable = true,
	},

	autopairs = {
		enable = true,
	},

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = true,
  },
}
