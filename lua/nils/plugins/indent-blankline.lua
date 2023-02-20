local conf = require("nils.configuration.indent-guide")

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  config = conf.indent_blankline,
}
