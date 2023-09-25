return {
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
		"ThePrimeagen/harpoon",
		lazy = false,
		config = function()
			require("harpoon").setup({})
			vim.keymap.set("n", "<M-h><M-m>", function()
				require("harpoon.mark").add_file()
			end)
			vim.keymap.set("n", "<M-h><M-l>", function()
				require("harpoon.ui").toggle_quick_menu()
			end)
			for i = 1, 5 do
				vim.keymap.set("n", string.format("<space>%s", i), function()
					require("harpoon.ui").nav_file(i)
				end)
			end
		end,
	},
	{
		"farmergreg/vim-lastplace",
	}
}
