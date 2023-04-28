local conf = {}
local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

function conf.filetree()
  require("nvim-tree").setup({
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      preserve_window_proportions = true,
    },
    renderer = {
      root_folder_label = false,
    },
  })
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
