local conf = require("nils.configuration.filetree")
return {
  "ThePrimeagen/harpoon",
  "nvim-telescope/telescope.nvim",
  "farmergreg/vim-lastplace",
  {
    "nvim-tree/nvim-tree.lua",
    config = conf.filetree,
    event = "UIEnter",
  },
}
