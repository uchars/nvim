local conf = {}

function conf.git()
  vim.g.gitblame_display_virtual_text = 0
  require("gitsigns").setup({})
end

return conf
