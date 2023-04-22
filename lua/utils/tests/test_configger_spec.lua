local Path = require("plenary.path")
local Configger = require("utils.configger")

local test_config_file = Path:new(vim.fn.stdpath("data") .. "/test_configger_test.json")
local test_default_config = {
  some_value = 42,
  another_value = "hello world"
}
local configger = Configger:new(test_default_config, test_config_file)

describe("Configger", function()
  it("should load a configuration file.", function()
    assert.equals(42, configger:get("some_value"))
  end)

  it("should return nil if key does not exist.", function()
    assert.equals(nil, configger:get("this_does_not_exist"))
  end)
end)
