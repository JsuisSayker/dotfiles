return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
	},
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<CR>" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<CR>" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<CR>" },
	},
}
