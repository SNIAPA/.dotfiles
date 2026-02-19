return {
	{
		"jpwol/thorn.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			theme = "dark",
			background = "warm",
			transparent = true,
			terminal = true,
			styles = {
				keywords   = { italic = false, bold = true },
				comments   = { italic = true, bold = false },
				strings    = { italic = false, bold = false },
				diagnostic = {
					underline = true,
					error     = { highlight = false },
					hint      = { highlight = false },
					info      = { highlight = false },
					warn      = { highlight = false },
				},
			},
		},
		config = function(_, opts)
			require("thorn").setup(opts)
			vim.cmd([[colorscheme thorn]])
			vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#568270' })
		end,
	}
}
