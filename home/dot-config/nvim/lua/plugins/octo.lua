return {
	"pwntester/octo.nvim",
	cmd = "Octo",
	opts = {
		picker = "fzf-lua",
		enable_builtin = true,
		diff = {
			provider = "diffview", -- explicit, gives you the tree file browser
		},
	},
	keys = {
		{ "<leader>oi", "<CMD>Octo issue list<CR>",        desc = "List GitHub Issues" },
		{ "<leader>op", "<CMD>Octo pr list<CR>",           desc = "List GitHub PullRequests" },
		{ "<leader>od", "<CMD>Octo discussion list<CR>",   desc = "List GitHub Discussions" },
		{ "<leader>on", "<CMD>Octo notification list<CR>", desc = "List GitHub Notifications" },
		{
			"<leader>os",
			function()
				require("octo.utils").create_base_search_command { include_current_repo = true }
			end,
			desc = "Search GitHub",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
		"sindrets/diffview.nvim", -- needed for pr review file tree
	},
}
