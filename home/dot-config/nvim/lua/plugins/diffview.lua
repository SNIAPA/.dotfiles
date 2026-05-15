return {
	"sindrets/diffview.nvim",
	config = function(_, _)
		require("diffview").setup({
			diff_binaries = false,
			enhanced_diff_hl = true,
		})
		--vim.api.nvim_set_hl(0, "DiffAdd", { bg = "NONE" })
		--vim.api.nvim_set_hl(0, "DiffDelete", { bg = "NONE" })
		--vim.api.nvim_set_hl(0, "DiffChange", { bg = "NONE" })
	end
}
