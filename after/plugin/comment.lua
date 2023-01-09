local ok, comment = pcall(require, "Comment")
if not ok then
  print("comment.nvim not installed")
  return
end

comment.setup()
