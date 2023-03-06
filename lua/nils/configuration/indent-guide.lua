local conf = {}

function conf.indent_blankline()
  require("indent_blankline").setup({
    show_current_context = true,
  })
end

return conf
