local ok, tree = pcall(require, "nvim-tree")
if not ok then
  print("NvimTree not installed")
  return
end

tree.setup({})
