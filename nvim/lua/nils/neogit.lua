local ok, neogit = pcall(require, "neogit")
if not ok then
  print("neogit not installed")
  return
end

local nnoremap = require('nils.keymap').nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
    neogit.open({ })
end);

nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>");
