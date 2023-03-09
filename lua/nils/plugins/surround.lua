local conf = require("nils.configuration.format")

return {
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = conf.surround,
  },
}
