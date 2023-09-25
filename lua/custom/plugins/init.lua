return {
	{
		'iamcco/markdown-preview.nvim',
		ft = {
			"markdown",
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		'stevearc/oil.nvim',
		lazy = false,
		config = function()
			require("oil").setup({
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = "actions.select_vsplit",
					["<C-h>"] = "actions.select_split",
					["<C-t>"] = "actions.select_tab",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
				},
				use_default_keymaps = false,
			})
		end
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy"
	},
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		config = function()
			require("transparent").setup({
				extra_groups = {
					"WinSeparator",
					"TelescopeNormal",
					"TelescopeSelection",
					"TelescopeBorder",
					"TelescopePrompt",
					"TelescopeMultiSelection",
					"TreesitterContext",
					"TreesitterContextLineNumber",
					"FloatBorder",
					"NormalFloat",
					"StatusLine",
					"GitSignsAdd",
					"GitSignsChange",
					"GitSignsDelete",
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					"NvimTreeStatusLine",
					"NvimTreeCursorLine",
					"NvimTreeWinSeparator",
					"NotifyERRORBorder",
					"NotifyWARNBorder",
					"NotifyINFOBorder",
					"NotifyDEBUGBorder",
					"NotifyTRACEBorder",
					"NotifyERRORBody",
					"NotifyWARNBody",
					"NotifyINFOBody",
					"NotifyDEBUGBody",
					"NotifyTRACEBody",
				},
			})
		end
	},
	{
		"github/copilot.vim",
		event = "BufEnter",
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<M-p>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "BufEnter",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = {
					"TelescopeResults",
					"TelescopePrompt",
					"vim",
					"NvimTree",
					"undotree",
					"terminal",
					"console",
					"term://*",
					"Term://*",
					"toggleterm",
				},
			})
		end,
	},
	{
		"kkoomen/vim-doge",
		event = "BufReadPost",
		build = function()
			vim.fn["doge#install"]()
		end,
	},
}
