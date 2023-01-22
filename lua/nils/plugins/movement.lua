local conf = require("nils.configuration.filetree")
return {
  "ThePrimeagen/harpoon",
  {
    "farmergreg/vim-lastplace",
    event = "BufEnter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = conf.filetree,
    event = "UIEnter",
  },
}
