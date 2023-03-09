local conf = require("nils.configuration.movement")
return {
  {
    "ThePrimeagen/harpoon",
    event = "BufEnter",
    config = conf.harpoon,
  },
  {
    "farmergreg/vim-lastplace",
    event = "BufEnter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = conf.filetree,
    lazy = false,
  },
  {
    "mbbill/undotree",
    event = "BufEnter",
  },
}
