local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Function template: `fn` expands to a Lua function
  s("f", {
    t("function "), i(1, "name"), t("()"),
    t({ "", "  " }), i(2, "-- body"),
    t({ "", "end" }),
  }),

  -- Print statement shortcut
  s("p", {
    t("print("), i(1, '"Hello, world!"'), t(")"),
  }),
}
