local conf = {}

function conf.zenmode()
  require("zen-mode").setup({})
end

function conf.colorizer()
  vim.opt.termguicolors = true
  require("colorizer").setup({
    "*",
  })
end

function conf.transparent()
  require("transparent").setup({
    extra_groups = {
      "TelescopeNormal",
      "TelescopePrompt",
    },
  })
end

function conf.github()
  require("github-theme").setup({})
end

function conf.gruvbox()
  require("gruvbox").setup({
    -- transparent_mode = true,
  })
end

function conf.kanagawa()
  require("kanagawa").setup({
    -- transparent = true,
  })
end

function conf.everblush()
  require("everblush").setup({
    -- transparent_background = true,
  })
end

function conf.tokyonight()
  require("tokyonight").setup({
    -- transparent = true,
  })
end

function conf.tundra()
  require("nvim-tundra").setup({
    -- transparent_background = true,
  })
end

function conf.nightfox()
  require("nightfox").setup({
    -- transparent = true,
  })
end

function conf.vscode()
  require("vscode").setup({
    disable_nvimtree_bg = true,
  })
end

return conf
