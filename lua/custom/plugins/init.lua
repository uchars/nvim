return {
	{
		'iamcco/markdown-preview.nvim',
		ft = {
			'markdown',
		},
		build = function()
			vim.fn['mkdp#util#install']()
		end,
	},
	{
		'Saecki/crates.nvim',
		event = { 'BufReadPost Cargo.toml' },
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			require('crates').setup {
				null_ls = {
					enabled = true,
					name = 'crates.nvim',
				},
			}
		end,
	},
	{
		'tpope/vim-surround',
		event = 'VeryLazy',
	},
	{
		'xiyaowong/nvim-transparent',
		lazy = false,
		config = function()
			require('transparent').setup {
				extra_groups = {
					'WinSeparator',
					'TelescopeNormal',
					'TelescopeSelection',
					'TelescopeBorder',
					'TelescopePrompt',
					'TelescopeMultiSelection',
					'TreesitterContext',
					'TreesitterContextLineNumber',
					'FloatBorder',
					'NormalFloat',
					'StatusLine',
					'GitSignsAdd',
					'GitSignsChange',
					'GitSignsDelete',
					'NvimTreeNormal',
					'NvimTreeNormalNC',
					'NvimTreeStatusLine',
					'NvimTreeCursorLine',
					'NvimTreeWinSeparator',
					'NotifyERRORBorder',
					'NotifyWARNBorder',
					'NotifyINFOBorder',
					'NotifyDEBUGBorder',
					'NotifyTRACEBorder',
					'NotifyERRORBody',
					'NotifyWARNBody',
					'NotifyINFOBody',
					'NotifyDEBUGBody',
					'NotifyTRACEBody',
					'CratesNvimLoading',
					'CratesNvimVersion',
					'CratesNvimPreRelease',
					'CratesNvimYanked',
					'CratesNvimNoMatch',
					'CratesNvimUpgrate',
					'CratesNvimError',
				},
			}
		end,
	},
	{
		'github/copilot.vim',
		event = 'BufEnter',
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap('i', '<M-p>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},
	{
		'f-person/git-blame.nvim',
		event = 'BufEnter',
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('nvim-autopairs').setup {
				disable_filetype = {
					'TelescopeResults',
					'TelescopePrompt',
					'vim',
					'NvimTree',
					'undotree',
					'terminal',
					'console',
					'term://*',
					'Term://*',
					'toggleterm',
				},
			}
		end,
	},
	{
		'kkoomen/vim-doge',
		event = 'BufReadPost',
		build = function()
			vim.fn['doge#install']()
		end,
	},
}
