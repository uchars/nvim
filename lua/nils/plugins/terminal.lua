local conf = require("nils.configuration.terminal")

return {
  "numToStr/FTerm.nvim",
  event = "UIEnter",
  config = conf.floatterm,
}
