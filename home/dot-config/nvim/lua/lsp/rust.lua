local snippets = {
	Ok = {
		postfix = "ok",
		body = "Ok(${receiver})",
		description = "Wrap the expression in a `Result::Ok`",
		scope = "expr",
	},
	["Box::pin"] = {
		postfix = "pinbox",
		body = "Box::pin(${receiver})",
		requires = "std::boxed::Box",
		description = "Put the expression into a pinned `Box`",
		scope = "expr",
	},
	["Arc::new"] = {
		postfix = "arc",
		body = "Arc::new(${receiver})",
		requires = "std::sync::Arc",
		description = "Put the expression into an `Arc`",
		scope = "expr",
	},
	Some = {
		postfix = "some",
		body = "Some(${receiver})",
		description = "Wrap the expression in an `Option::Some`",
		scope = "expr",
	},
	Err = {
		postfix = "err",
		body = "Err(${receiver})",
		description = "Wrap the expression in a `Result::Err`",
		scope = "expr",
	},
	["Rc::new"] = {
		postfix = "rc",
		body = "Rc::new(${receiver})",
		requires = "std::rc::Rc",
		description = "Put the expression into an `Rc`",
		scope = "expr",
	},
}



vim.lsp.config['rust-analyzer'] = {
	cmd = { 'rust-analyzer' },
	filetypes = { "rust" },
	root_markers = { "Cargo.lock", '.git' },
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
				workspace = true,
			},
			cargo = {
				allFeatures = false,
			},
			completion = {
				fullFunctionSignatures = { enable = true },
				snippets = { custom = snippets },
				termSearch = { enable = true },
			},
			diagnostics = {
				styleLints = { enable = true }
			},
			semanticHighlighting = {
				strings = { enable = true },
			},
			assist = {
				emitMustUse = true,
				preferSelf = true
			},
			files = {
				-- Default is "client" but it misses events
				watcher = "server"
			},
			hover = {
				memoryLayout = {
					niches = true,
					padding = "hexadecimal",
				}
			},
			imports = {
				granularity = { enforce = true },
				preferPrelude = true
			},
			inlayHints = {
				bindingModeHints = { enable = true },
				closureCaptureHints = { enable = true },
				closureReturnTypeHints = { enable = "with_block" },
				-- closureStyle = "with_id", -- sometimes is usefull for debuggin
				discriminantHints = { enable = true },
				expressionAdjustmentHints = { enable = "always", mode = "postfix" },
				genericParameterHints = { lifetime = { enable = true }, type = { enable = true } },
				implicitDrops = { enable = true },
				implicitSizeBoundHints = { enable = true },
				lifetimeElisionHints = { enable = "always", useParameterNames = true },
				parameterHints = { missingArguments = { enable = true } },
				rangeExclusiveHints = { enable = true },
				reborrowHints = { enable = true },
				typeHints = {
					hideClosureInitialization = true,
					hideInferredTypes = true,
					hideNamedConstructor = true,

				},
				renderColons = true,
			},
		}

	}
}
vim.lsp.enable('rust-analyzer')
