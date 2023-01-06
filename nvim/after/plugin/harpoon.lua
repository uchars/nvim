local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end
local hmark = pcall(require, "harpoon.mark")
local hui = pcall(require, "harpoon.ui")

harpoon.setup({})

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
