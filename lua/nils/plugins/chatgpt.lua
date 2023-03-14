local conf = require("nils.configuration.chatgpt")
return {
  "jackMort/ChatGPT.nvim",
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = conf.chatgpt,
}
