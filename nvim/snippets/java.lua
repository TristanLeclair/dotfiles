local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

-- Repeat Insernode text
-- @param insert_node_id The id of the insert node to repeat (the first line from)
local ri = function(insert_node_id)
  return f(function(args)
    return args[1][1]
  end, insert_node_id)
end

ls.add_snippets("all", {
  s(
    { trig = "aaa", desc = "" },
    fmta(
      [[
    // Arrange
    <>
    // Act

    // Assert
    ]],
      { i(0) }
    )
  ),

  s(
    { trig = "fori", desc = "Indexed for loop" },
    fmta(
      [[
    for (int <> = <>; <> << <>; <>++) {
      <>
    }
    ]],
      {
        i(1, "INDEX"),
        i(2, "0"),
        ri(1),
        i(3, "LIMIT"),
        ri(1),
        i(0),
      }
    )
  ),

  s(
    { trig = "I", desc = "" },
    fmta(
      [[
      for (<> <> : <>) {
        <>
      }
  ]],
      {
        i(1, "element_type"),
        i(2, "var"),
        i(3, "iterable"),
        i(0),
      }
    )
  ),

  s(
    { trig = "ifn", desc = "" },
    fmta(
      [[
      if (<> == null) {
        <>
      }
  ]],
      {
        i(1, "var"),
        i(0),
      }
    )
  ),

  s(
    { trig = "inn", desc = "" },
    fmta(
      [[
      if (<> != null) {
        <>
      }
  ]],
      {
        i(1, "var"),
        i(0),
      }
    )
  ),

  s(
    { trig = "itar", desc = "" },
    fmta(
      [[
      for (int <> = <>; <> << <>.length; <>++) {
        <> <> = <>[<>];
        <>
      }
  ]],
      {
        i(1, "INDEX"),
        i(2, "0"),
        ri(1),
        i(3, "ARRAY"),
        ri(1),
        i(4, "element_type"),
        i(5, "var"),
        ri(3),
        ri(1),
        i(0),
      }
    )
  ),

  s(
    { trig = "serr", desc = "" },
    fmta(
      [[
    System.err.println(<>);
    ]],
      { i(1, "boo") }
    )
  ),

  s(
    { trig = "sout", desc = "" },
    fmta(
      [[
    System.out.println(<>);
    ]],
      { i(1, "boo") }
    )
  ),

  s(
    { trig = "main", desc = "" },
    fmta(
      [[
    public static void main(String[] args) {
      <>
    }
    ]],
      { i(0) }
    )
  ),

  s(
    { trig = "class", desc = "" },
    fmta(
      [[
    <> class <> {
      <>
    }
    ]],
      { c(1, {
        t("public"),
        t("private"),
      }), i(2, "className"), i(0) }
    )
  ),

  -- Very long example for a java class.
  s("fn", {
    c(1, {
      t("public "),
      t("private "),
    }),
    c(2, {
      i(nil, ""),
      t("void"),
      t("String"),
      t("char"),
      t("int"),
      t("double"),
      t("boolean"),
    }),
    t(" "),
    i(3, "myFunc"),
    t("("),
    i(4),
    t(")"),
    c(5, {
      t(""),
      sn(nil, {
        t({ "", " throws " }),
        i(1),
      }),
    }),
    t({ " {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s(
    { trig = "test", desc = "" },
    fmta(
      [[
      @Test
      void <>() {
        // Arrange
        <> 
        // Act
          
        // Assert
      }
    ]],
      { i(1, "testName"), i(0) }
    )
  ),
})
