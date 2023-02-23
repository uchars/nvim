local conf = {}
local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end

function conf.filetree()
  require("nvim-tree").setup({
    view = {
      adaptive_size = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
  })
  nnoremap("<C-b>", ":NvimTreeToggle<CR>", { silent = true })

  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

function conf.harpoon()
  require("harpoon").setup({})

  nnoremap("<M-h><M-m>", function()
    require("harpoon.mark").add_file()
  end)
  nnoremap("<M-h><M-l>", function()
    require("harpoon.ui").toggle_quick_menu()
  end)

  for i = 1, 5 do
    nnoremap(string.format("<space>%s", i), function()
      require("harpoon.ui").nav_file(i)
    end)
  end
end

return conf
