local conf = {}
local nnoremap = require("nils.keymap").nnoremap

function conf.neotest()
  nnoremap("<F5>", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
  require("neotest").setup({
    adapters = {
      require("neotest-plenary"),
      require("neotest-dart")({
        command = "flutter",
        use_lsp = false,
      }),
      require("neotest-jest")({
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      }),
      require("neotest-vitest"),
      require("neotest-python"),
    },
  })
end

return conf
