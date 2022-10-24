local has_flutter_tools = pcall(require, "flutter-tools")
if not has_flutter_tools then
  print("flutter-tools not installed")
  return
end

print("hi")
require("flutter-tools").setup {
    closing_tags = {
        enabled = true,
        prefix = ">",
    },

    lsp = {
        color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
        },

        settings = {
            showTodos = false,
        }
    }
}
