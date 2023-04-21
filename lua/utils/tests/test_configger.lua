local Path = require("plenary.path")
local Configger = require("utils.configger")

local test_config_file = Path:new(vim.fn.stdpath("data") .. "/test_configger_test.json")
local test_default_config = {
  some_value = 42,
  another_value = "hello world"
}


-- for some reason after the test runs, the content of test.configger.json is either [] or {colorscheme: "onedark"}
describe("Configger", function()
  it("should load a configuration file.", function()
    local configger = Configger:new(test_default_config, test_config_file)
    print("CONFIG_JSON_TEST 1: " .. vim.fn.json_encode(configger.config))
    assert.equals(42, configger:get("some_value"))
  end)

  -- it("should return nil if key does not exist.", function()
  --   local configger = Configger:new({ some_value = 42, another_value = "hello world" }, test_config_file)
  --   print("SOME_VALUE:" .. configger:get("some_value"))
  --   assert.equals(nil, configger:get("this_does_not_exist"))
  -- end)
end)
