-- ~/.config/nvim/lua/snippets/cs.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Property snippet
  s("p", {
    t("public "), i(1, "int"), t(" "), i(2, "MyProperty"), t(" { get; set; }"),
  }),

  -- Constructor snippet
  s("c", {
    t("public "), i(1, "ClassName"), t("()"),
    t({ "", "{" }),
    t({ "", "    " }), i(2, "// constructor body"),
    t({ "", "}" }),
  }),

  s("i", {
    t("if "), t("()"),
    t({ "", "{" }),
    t({ "", "    " }), i(2, "// body"),
    t({ "", "}" }),
  }),

  s("d", {
    t("Debug.Log"), t("("), i(1, "debug"), t(");"),
  }),

  s("d\"\"", {
    t("Debug.Log"), t("(\""), i(1, "debug"), t("\");"),
  }),

  s("f", {
    t("private void "), i(1, "name"), t("()"),
    t({ "", "  " }), t("{"),
    t({ "", "  " }), i(2, "-- body"),
    t({ "", "  " }), t("}"),
  }),
}
