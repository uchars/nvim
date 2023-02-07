local statuslineConf = require("nils.configuration.statusline")
local colorConf = require("nils.configuration.color-stuff")

return {
  { "ellisonleao/gruvbox.nvim", lazy = false, config = colorConf.gruvbox },
  { "xiyaowong/nvim-transparent", lazy = false, config = colorConf.transparent },
  { "projekt0n/github-nvim-theme", lazy = false, config = colorConf.github },
  { "rebelot/kanagawa.nvim", lazy = false, config = colorConf.kanagawa },
  { "Everblush/everblush.nvim", lazy = false, config = colorConf.everblush },
  { "folke/tokyonight.nvim", lazy = false, config = colorConf.tokyonight },
  { "sam4llis/nvim-tundra", lazy = false, config = colorConf.tundra },
  { "EdenEast/nightfox.nvim", lazy = false, config = colorConf.nightfox },
  { "junegunn/seoul256.vim", lazy = false },
  { "Mofiqul/vscode.nvim", lazy = false, config = colorConf.vscode },
  {
    "folke/zen-mode.nvim",
    event = "BufEnter",
    config = colorConf.zenmode,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    config = statuslineConf.lualine,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufEnter",
    config = colorConf.colorizer,
  },
}
