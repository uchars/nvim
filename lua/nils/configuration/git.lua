local conf = {}
local Remap = require("nils.keymap")
local nnoremap = Remap.nnoremap

function conf.git()
  vim.g.gitblame_display_virtual_text = 0
  vim.g.gitblame_date_format = "%r"
  vim.g.gitblame_message_template = "<author>, <date> • <summary>"
  require("gitsigns").setup({})
  nnoremap("<leader>gs", "<cmd>Git<CR>")
  nnoremap("gf", "<cmd>diffget //2<CR>")
  nnoremap("gj", "<cmd>diffget //3<CR>")
end

return conf
