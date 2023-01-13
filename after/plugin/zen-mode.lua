local ok, zenmode = pcall(require, "zen-mode")
if not ok then
  print("zen-mode not installed")
  return
end

zenmode.setup({})
