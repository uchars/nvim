local conf = {}

function conf.git()
  vim.g.gitblame_display_virtual_text = 0
  vim.g.gitblame_date_format = "%r"
  vim.g.gitblame_message_template = "<author>, <date> • <summary>"
  require("gitsigns").setup({})
end

return conf
