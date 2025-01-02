local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

ls.add_snippets("javascriptreact", {
  s("rfc", {
    t("const "),
    i(1, "ComponentName"),
    t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    " }),
    i(2, "<div>content</div>"),
    t({ "", "  );", "};", "", "export default " }),
    f(function(args)
      return args[1][1]
    end, { 1 }),
  }),
})
