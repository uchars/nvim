local conf = {}

function conf.floatterm()
  require("FTerm").setup({
    border = "double",
    dimensions = {
      height = 0.5,
      width = 0.8,
    },
    cmd = getTerminal(),
    auto_close = true,
  })
end

function getTerminal()
  if vim.fn.has("win32") then
    return "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
  else
    return nil
  end
end

return conf
