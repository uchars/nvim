local conf = {}

function conf.neogit()
  local nnoremap = require("nils.keymap").nnoremap
  local _, neogit = pcall(require, "neogit")

  neogit.setup({})

  nnoremap("<leader>gs", function()
    neogit.open({})
  end)

  nnoremap("<leader>ga", "<cmd>!git fetch --all<CR>")
end

function conf.gitsigns()
  require("gitsigns").setup({})
end

return conf
