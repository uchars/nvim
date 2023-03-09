local conf = require("nils.configuration.terminal")

return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = conf.floatterm,
}
