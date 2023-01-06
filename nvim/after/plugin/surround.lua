local ok, neogit = pcall(require, "nvim-surround")
if not ok then
  print("nvim-surround not installed")
  return
end

require("nvim-surround").setup({
  -- Configuration here, or leave empty to use defaults
})
