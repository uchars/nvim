local conf = {}

function conf.lualine()
  local sections = { lualine_a = { hello } }

  require("lualine").setup({
    sections = sections,
  })
end

return conf
