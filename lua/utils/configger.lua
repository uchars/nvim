-- Import dependencies
local Path = require("plenary.path")

---@class Configger
Configger = {
  config = {},
}
-- Creates a new Configger object
---@param default_config? table The default config
---@param config_file? string The filename of the config file (creates new file if it doesn't exist)
---@return Configger configger The Configger object
function Configger:new(default_config, config_file)
  local configger = {}
  setmetatable(configger, self)
  self.__index = self

  if config_file == nil then
    self.config_file = Path:new(vim.fn.stdpath("data") .. "/configger.json")  -- Set the config file to the default config file
  else
    self.config_file = Path:new(vim.fn.stdpath("data") .. "/" .. config_file) -- Set the config file to the specified config file
  end

  if self.config_file:exists() then
    local config_json = vim.fn.json_decode(self.config_file:read()) -- Read the config file
    self.config = vim.tbl_extend("force", self.config, config_json) -- Merge the config with the default config
  else
    self.config = default_config or {}
    self.config_file:write(vim.fn.json_encode(self.config), "w") -- Write the default config to the config file if it doesn't exist
  end

  return self
end

-- Reads the config file
---@return table config The current config
function Configger:readConfig()
  if self.config_file:exists() then
    local config_json = vim.fn.json_decode(self.config_file:read()) -- Read the config file
    self.config = vim.tbl_extend("force", self.config, config_json) -- Merge the config with the default config
  else
    self.config_file:write(vim.fn.json_encode(self.config), "w")    -- Write the default config to the config file if it doesn't exist
  end
  return self.config
end

-- Returns the current config
---@return table config The cached config
function Configger:getConfig()
  return self.config
end

-- Sets the full config
---@param config table The config to set
function Configger:setConfig(config)
  self.config = config
  self.config_file:write(vim.fn.json_encode(self.config), "w")
end

-- Returns the value of a config key
---@param key string The key of the config value
---@return any value The value of the config key
function Configger:get(key)
  return self.config[key]
end

-- Sets the value of a config key
---@param key string The key of the config value
---@param value any The value of the config key
function Configger:set(key, value)
  self.config[key] = value
  self.config_file:write(vim.fn.json_encode(self.config), "w")
end

-- Deletes a config key
---@param key string The key of the config value
function Configger:delete(key)
  self.config[key] = nil
  self.config_file:write(vim.fn.json_encode(self.config), "w")
end

-- Get the full path of the config file
---@return string path The full path of the config file
function Configger:getConfigPath()
  return tostring(self.config_file)
end

return Configger
