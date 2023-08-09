local conf = require("nils.configuration.indent-guide")

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  config = conf.indent_blankline,
}
