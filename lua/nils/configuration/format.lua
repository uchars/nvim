local conf = {}

function conf.prettier()
  require("prettier").setup({
    bin = "prettier",
    cli_options = {
      config_precedence = "prefer-file",
    },
  })
end

function conf.surround()
  require("nvim-surround").setup({
    -- Configuration here, or leave empty to use defaults
  })
end

return conf
