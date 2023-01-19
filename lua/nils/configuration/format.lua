local conf = {}

function conf.prettier()
  require("prettier").setup({
    bin = "prettier",
    cli_options = {
      config_precedence = "prefer-file",
    },
  })
end

return conf
