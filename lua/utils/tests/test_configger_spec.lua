local Path = require("plenary.path")
local Configger = require("utils.configger")

local test_config_file = "test_configger_test.json"
local test_default_config = {
  some_value = 42,
  another_value = "hello world"
}
print("Creating test config file: " .. tostring(test_config_file))
local configger = Configger:new(test_default_config, test_config_file)

describe("Configger", function()
  it("should return default config if config file is removed.", function()
    os.remove(tostring(test_config_file))
    assert.equals(42, configger:get("some_value"))
    assert.equals("hello world", configger:get("another_value"))
  end)

  it("should return new config.", function()
    local new_config = {
      new_value = 420,
      another_new_value = "Noah"
    }
    configger:setConfig(new_config)
    assert.equals(new_config, configger:getConfig())
    assert.equals(420, configger:get("new_value"))
    assert.equals("Noah", configger:get("another_new_value"))
    assert.equals(nil, configger:get("some_value"))
  end)

  it("should add configuration key.", function()
    configger:set("new_added_value", "test")
    assert.equals("test", configger:get("new_added_value"))
  end)

  it("should update configuration key.", function()
    assert.equals("test", configger:get("new_added_value"))
    configger:set("new_added_value", "test2")
    assert.equals("test2", configger:get("new_added_value"))
  end)

  it("should delete configuration key.", function()
    assert.equals("test2", configger:get("new_added_value"))
    configger:delete("new_added_value")
    assert.equals(nil, configger:get("new_added_value"))
  end)

  it("should return nil if key does not exist.", function()
    assert.equals(nil, configger:get("this_does_not_exist"))
    assert.equals(nil, configger:get("NEW_VALUE"))
  end)
end)

print("Removing test config file: " .. test_config_file)
os.remove(configger:getConfigPath())
