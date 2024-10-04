local ls = require "luasnip"
---@type function
local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
---@type function
local sn = ls.snippet_node
---@type function
local isn = ls.indent_snippet_node
---@type function
local t = ls.text_node
---@type function
local i = ls.insert_node
---@type function
local f = ls.function_node
---@type function
local c = ls.choice_node
---@type function
local d = ls.dynamic_node
---@type function
local r = ls.restore_node
ls.add_snippets("javascript", {
  s({ trig = "cl", desc = "console.log" }, fmta([[console.log(<>)]], { i(1) })),
  s("ce", fmta([[console.error(<>)]], { i(1) })),
  s("cw", fmta([[console.warn(<>)]], { i(1) })),
  s("ci", fmta([[console.info(<>)]], { i(1) })),
  s("ct", fmta([[console.trace(<>)]], { i(1) })),
  s("cd", fmta([[console.dir(<>)]], { i(1) })),
  s("db", fmta([[debugger;]], {})),
  s("us", fmta([["use strict";]], {})),
  s("dowhile", {
    t { "do {", "\t" },
    i(2),
    t { "", "} while (" }, i(1, "condition"), t ")"
  }),
  s("settimeout", {
    t { "setTimeout(() => {", "\t" },
    i(2),
    t { "", "}, " }, i(1, "timeout"), t ")"
  }),
  s("forin", {
    t "for (const ", i(2, "element"), t " in ", i(1, "object"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("forof", {
    t "for (const ", i(2, "element"), t " of ", i(1, "object"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("forofa", {
    t "for await (const ", i(2, "element"), t " of ", i(1, "object"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("fn", {
    t "function ", i(1, "name"), t "(", i(2, "params"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("fna", {
    t "async function ", i(1, "name"), t "(", i(2, "params"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("fng", {
    t "function* ", i(1, "name"), t "(", i(2, "params"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("fnag", {
    t "async function* ", i(1, "name"), t "(", i(2, "params"), t { ") {", "\t" },
    i(3),
    t { "", "}" }
  }),
  s("afn", {
    i(1, "param"), t " => ", i(2)
  }),
  s("afna", {
    t "async ", i(1, "param"), t " => ", i(2),
  }),
  s("imp", {
    t [[import { ]], i(2), t [[ } from "]], i(1), t [["]]
  }),
  s("impn", {
    t [[import * as ]], i(2, "name"), t [[ from "]], i(1), t [["]]
  }),
  s("while", {
    t "while (", i(1, "condition"), t { ") {", "\t" },
    i(2),
    t { "", "}" }
  }),
  s("if", {
    t "if (", i(1, "condition"), t { ") {", "\t" },
    i(2),
    t { "", "}" }
  }),
  s("ifelse", {
    t "if (", i(1, "condition"), t { ") {", "\t" },
    i(2),
    t { "", "} else {", "\t" },
    i(3),
    t { "", "}" }
  })
})
