local conf = require("nils.configuration.flutter")

return {
  {
    "akinsho/flutter-tools.nvim",
    ft = {
      "dart",
    },
    config = conf.flutter,
  },
}
