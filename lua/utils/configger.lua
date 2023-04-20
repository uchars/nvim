-- Import dependencies
local Path = require("plenary.path")

Configger = {
  config = {},
}

function Configger:new(config)
  local configger = {}
  setmetatable(configger, self)
  self.__index = self
  configger.config = config
  configger.config_path = vim.fn.stdpath("data") .. "/configger.json"
  configger.config_file = Path:new(configger.config_path)

  return configger
end

-- Returns the full config
-- @return The full config
function Configger:getConfig()
  if self.config_file:exists() then
    local config_json = vim.fn.json_decode(self.config_file:read()) -- Read the config file
    self.config = vim.tbl_extend("force", self.config, config_json) -- Merge the config with the default config
  else
    self.config_file:write(vim.fn.json_encode(self.config), "w")    -- Write the default config to the config file if it doesn't exist
  end

  return self.config
end

-- Sets the full config
-- @param config The config to set
function Configger:setConfig(config)
  self.config = config
  self.config_file:write(vim.fn.json_encode(self.config), "w")
end

-- Returns the value of a config key
-- @param key The key of the config value
function Configger:getConfigValue(key)
  return self.config[key]
end

-- Sets the value of a config key
-- @param key The key of the config value
function Configger:setConfigValue(key, value)
  self.config[key] = value
  self.config_file:write(vim.fn.json_encode(self.config), "w")
end

-- Returns the path of the config file
-- @return The path of the config file
function Configger:getPath()
  return self.config_path
end

-- Sets the path of the config file
-- @param path The path of the config file
function Configger:setPath(path)
  self.config_path = path
  self.config_file = Path:new(self.config_path)
end
