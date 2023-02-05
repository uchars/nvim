local conf = {}
local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

function conf.filetree()
  require("nvim-tree").setup({})
  nnoremap("<C-b>", ":NvimTreeToggle<CR>", { silent = true })
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
