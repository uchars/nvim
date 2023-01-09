local ok, lualine = pcall(require, "lualine")
if not ok then
  print("lualine not installed")
  return
end

local sections = { lualine_a = { hello } }

lualine.setup({
  sections = sections,
})
