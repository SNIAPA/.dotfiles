return {
	'nvim-mini/mini.nvim',
	version = false,
	config = function(_, opts)
		require('mini.completion').setup({
			window = {
				info = { border = 'none' },
				signature = { border = 'none' },
			},
		})
	end
}
