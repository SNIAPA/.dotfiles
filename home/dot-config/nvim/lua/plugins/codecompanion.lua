return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = {
		"CodeCompanion",
		"CodeCompanionChat",
		"CodeCompanionActions",
		"CodeCompanionCmd",
	},
	keys = {
		{ "<leader>ai", "<cmd>CodeCompanion<cr>",             mode = { "n", "v" }, desc = "Inline assistant" },
		{ "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>",  mode = { "n", "v" }, desc = "Toggle chat" },
		{ "<leader>ao", "<cmd>CodeCompanionChat<cr>",         desc = "Open chat" },
		{ "<leader>ap", "<cmd>CodeCompanionActions<cr>",      mode = { "n", "v" }, desc = "Action palette" },
	},
	opts = {
		adapters = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					schema = {
						model = {
							default = "claude-sonnet-4-6",
						},
					},
					handlers = {
						form_parameters = function(self, params, messages)
							params.temperature = nil
							return params
						end,
					},
				})
			end,
		},
		strategies = {
			chat   = { adapter = "anthropic" },
			inline = { adapter = "anthropic" },
			agent  = { adapter = "anthropic" },
		},
		interactions = {
			cli = {
				agent = "claude_code",
				agents = {
					claude_code = {
						cmd = "claude",
						description = "Claude Code CLI",
					},
				},
			},
		},
	},
}
