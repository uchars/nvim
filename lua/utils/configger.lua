-- Import dependencies
local Path = require("plenary.path")

configger = {}

local config = {}
local config_path = vim.fn.stdpath("data") .. "/configger.json"
local config_file = Path:new(config_path)

configger.get = function()
  if config_file:exists() then
    local config_json = vim.fn.json_decode(config_file:read())
    config = vim.tbl_extend("force", config, config_json)
  else
    config_file:write(vim.fn.json_encode(config), "w")
  end

  return config
end
