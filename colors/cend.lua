vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" == 1 then
  vim.cmd "syntax reset"
end

vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "cend"
-- The ground, hue 43°, which is wood ash under a 1300 K flame. Ash is
-- spectrally flat, so it lands within a degree of the bare flame itself.
-- Seven steps, finely spaced, because a float over a statusline over a
-- cursorline has to read as one material at different distances.
local c = {
  bg_deep = "#0f0c0a"; -- L 0.157 · floats, sidebars
  bg0 = "#171311";     -- L 0.191 · editor bg1 = "#201b19";     -- L 0.227 · cursorline
  bg2 = "#2a2422";     -- L 0.266 · statusline
  bg3 = "#362f2c";     -- L 0.312 · splits
  bg4 = "#463e3a";     -- L 0.371 · hover
  bg5 = "#5a504c";     -- L 0.440 · float edges
  fg = "#e6d5c2";      -- L 0.882 · 12.89:1 on hard
  fg_dim = "#a09384";  -- L 0.670 ·  6.15:1 · operators, delimiters
  comment = "#73665b"; -- L 0.519 ·  3.32:1 · quiet on purpose
  gutter = "#4e4641";  -- L 0.401 ·  2.00:1 · line numbers, inlay
  brass = "#fcba81";   --  61.4° · L 0.838 · sodium D 589 nm      · functions, methods, calls
  ember = "#ea9875";   --  43.8° · L 0.754 · blackbody 1300 K     · properties, fields, params, UI
  sap = "#99af6b";     -- 123.4° · L 0.721 · C2 Swan 563 nm       · every literal value
  cinder = "#d1766e";  --  25.9° · L 0.665 · CaOH band 622 nm     · keywords, control flow, storage
  frost = "#4e89a2";   -- 227.4° · L 0.600 · C2 Swan 474 nm       · types, classes, constructors
  error = "#d25780";   --   2.0° · C 0.160
  warn = "#f4a21c";    --  71.7° · C 0.160
  ok = "#43b16a";      -- 152.1° · C 0.145
  hint = "#20c9cb";    -- 196.2° · C 0.125
  info = "#58bdff";    -- 240.4° · C 0.134
  vis = "#2f1e17";
  add = "#202515";
  del = "#301d1b";
  mod = "#12262e";
}
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end
hl("Normal", { fg = c.fg; bg = c.bg0; })
hl("NormalNC", { fg = c.fg; bg = c.bg0; })
hl("NormalFloat", { fg = c.fg; bg = c.bg_deep; })
hl("FloatBorder", { fg = c.bg5; bg = c.bg_deep; })
hl("FloatTitle", { fg = c.ember; bold = true; })
hl("FloatFooter", { fg = c.comment; bg = c.bg_deep; })
hl("Cursor", { fg = c.bg0; bg = c.ember; })
hl("lCursor", { fg = c.bg0; bg = c.ember; })
hl("CursorIM", { fg = c.bg0; bg = c.ember; })
hl("TermCursor", { fg = c.bg0; bg = c.ember; })
hl("CursorLine", { bg = c.bg1; })
hl("CursorColumn", { bg = c.bg1; })
hl("ColorColumn", { bg = c.bg1; })
hl("CursorLineNr", { fg = c.ember; bold = true; })
hl("LineNr", { fg = c.gutter; })
hl("LineNrAbove", { fg = c.gutter; })
hl("LineNrBelow", { fg = c.gutter; })
hl("SignColumn", { fg = c.gutter; bg = c.bg0; })
hl("FoldColumn", { fg = c.gutter; bg = c.bg0; })
hl("Folded", { fg = c.comment; bg = c.bg1; })
hl("Visual", { bg = c.vis; })
hl("VisualNOS", { bg = c.vis; })
hl("Search", { fg = c.bg0; bg = c.brass; })
hl("IncSearch", { fg = c.bg0; bg = c.ember; })
hl("CurSearch", { fg = c.bg0; bg = c.ember; })
hl("Substitute", { fg = c.bg0; bg = c.error; })
hl("MatchParen", { fg = c.ember; bold = true; })
hl("Pmenu", { fg = c.fg; bg = c.bg_deep; })
hl("PmenuKind", { fg = c.frost; bg = c.bg_deep; })
hl("PmenuExtra", { fg = c.fg_dim; bg = c.bg_deep; })
hl("PmenuSel", { bg = c.bg2; bold = true; })
hl("PmenuKindSel", { fg = c.frost; bg = c.bg2; bold = true; })
hl("PmenuExtraSel", { fg = c.fg_dim; bg = c.bg2; bold = true; })
hl("PmenuMatchSel", { fg = c.ember; bold = true; })
hl("PmenuMatch", { fg = c.ember; bold = true; })
hl("PmenuBorder", { fg = c.bg5; bg = c.bg_deep; })
hl("PmenuSbar", { bg = c.bg2; })
hl("PmenuThumb", { bg = c.bg4; })
hl("PreInsert", { fg = c.gutter; italic = true; })
hl("FloatShadow", { bg = c.bg_deep; blend = 80; })
hl("FloatShadowThrough", { bg = c.bg_deep; blend = 100; })
hl("WildMenu", { fg = c.bg0; bg = c.ember; })
hl("StatusLine", { fg = c.fg_dim; bg = c.bg2; })
hl("StatusLineNC", { fg = c.gutter; bg = c.bg1; })
hl("TabLine", { fg = c.comment; bg = c.bg1; })
hl("TabLineFill", { bg = c.bg1; })
hl("TabLineSel", { fg = c.fg; bg = c.bg0; bold = true; })
hl("WinBar", { fg = c.fg_dim; bg = c.none; })
hl("WinBarNC", { fg = c.gutter; bg = c.none; })
hl("WinSeparator", { fg = c.bg3; bg = c.bg0; })
hl("VertSplit", { fg = c.bg3; bg = c.bg0; })
hl("ModeMsg", { fg = c.ember; bold = true; })
hl("MoreMsg", { fg = c.info; })
hl("Question", { fg = c.info; })
hl("ErrorMsg", { fg = c.error; bold = true; })
hl("WarningMsg", { fg = c.warn; })
hl("OkMsg", { fg = c.ok; })
hl("MsgArea", { fg = c.fg_dim; })
hl("MsgSeparator", { fg = c.bg3; })
hl("NonText", { fg = c.bg4; })
hl("Whitespace", { fg = c.bg3; })
hl("SpecialKey", { fg = c.bg4; })
hl("EndOfBuffer", { fg = c.bg1; })
hl("Conceal", { fg = c.comment; })
hl("Directory", { fg = c.frost; })
hl("Title", { fg = c.ember; bold = true; })
hl("QuickFixLine", { bg = c.bg2; bold = true; })
hl("qfLineNr", { fg = c.gutter; })
hl("qfFileName", { fg = c.frost; })
hl("netrwTreeBar", { fg = c.bg4; })
hl("netrwMarkFile", { bg = c.bg2; bold = true; })
hl("netrwClassify", { fg = c.comment; })
hl("DiffAdd", { bg = c.add; })
hl("DiffDelete", { bg = c.del; })
hl("DiffChange", { bg = c.mod; })
hl("DiffText", { bg = c.bg3; bold = true; })
hl("diffAdded", { fg = c.ok; })
hl("diffRemoved", { fg = c.error; })
hl("diffChanged", { fg = c.info; })
hl("diffOldFile", { fg = c.warn; })
hl("diffNewFile", { fg = c.ok; })
hl("diffFile", { fg = c.frost; })
hl("diffLine", { fg = c.comment; })
hl("diffIndexLine", { fg = c.comment; })
hl("Added", { fg = c.ok; })
hl("Removed", { fg = c.error; })
hl("Changed", { fg = c.info; })
hl("SpellBad", { undercurl = true; sp = c.error; })
hl("SpellCap", { undercurl = true; sp = c.warn; })
hl("SpellLocal", { undercurl = true; sp = c.info; })
hl("SpellRare", { undercurl = true; sp = c.hint; })

hl("Comment", { fg = c.comment; })


hl("Constant", { fg = c.sap; })
hl("String", { fg = c.sap; })
hl("Character", { fg = c.sap; })
hl("Number", { fg = c.sap; })
hl("Float", { fg = c.sap; })
hl("Boolean", { fg = c.sap; })


hl("Identifier", { fg = c.fg; })
hl("Function", { fg = c.brass; })

hl("Statement", { fg = c.cinder; })
hl("Conditional", { fg = c.cinder; })
hl("Repeat", { fg = c.cinder; })
hl("Label", { fg = c.cinder; })
hl("Keyword", { fg = c.cinder; })
hl("Exception", { fg = c.cinder; })
hl("Operator", { fg = c.fg; })

hl("PreProc", { fg = c.cinder; })
hl("Include", { fg = c.cinder; })
hl("Define", { fg = c.cinder; })
hl("Macro", { fg = c.cinder; })
hl("PreCondit", { fg = c.cinder; })

hl("Type", { fg = c.frost; })
hl("StorageClass", { fg = c.frost; })
hl("Structure", { fg = c.frost; })
hl("Typedef", { fg = c.frost; })

hl("Underlined", { underline = true; })
hl("Bold", { bold = true; })
hl("Italic", { italic = true; })
hl("Ignore", { fg = c.gutter; })
hl("Error", { fg = c.error; })
hl("Todo", { fg = c.bg0; bg = c.warn; bold = true; })


hl("markdownH1", { fg = c.ember; bold = true; })
hl("markdownH2", { fg = c.brass; bold = true; })
hl("markdownH3", { fg = c.frost; bold = true; })
hl("markdownCode", { fg = c.sap; })
hl("markdownCodeBlock", { fg = c.sap; })
hl("markdownLinkText", { fg = c.frost; underline = true; })
hl("markdownUrl", { fg = c.comment; })
hl("helpHyperTextJump", { fg = c.frost; underline = true; })
hl("helpCommand", { fg = c.brass; })
hl("helpExample", { fg = c.sap; })

hl("Special", { fg = c.fg; })
hl("SpecialChar", { fg = c.ember; })
hl("Tag", { fg = c.fg; })
hl("Delimiter", { fg = c.fg_dim; })
hl("SpecialComment", { fg = c.comment; })
hl("Debug", { fg = c.error; })

hl("@variable", { fg = c.fg; })
hl("@variable.builtin", { fg = c.fg; })
hl("@variable.parameter", { fg = c.fg; })
hl("@variable.parameter.builtin", { fg = c.fg; })
hl("@variable.member", { fg = c.fg; })
hl("@property", { fg = c.fg; })
hl("@field", { fg = c.fg; })

-- constants: the name is not coloured, the value is
hl("@constant", { fg = c.fg; })
hl("@constant.builtin", { fg = c.fg; })
hl("@constant.macro", { fg = c.fg; })
hl("@number", { fg = c.sap; })
hl("@number.float", { fg = c.sap; })
hl("@boolean", { fg = c.sap; })

-- strings, and every other literal, share one pigment
hl("@string", { fg = c.sap; })
hl("@string.documentation", { fg = c.sap; })
hl("@string.regexp", { fg = c.ember; })
hl("@string.escape", { fg = c.ember; })
hl("@string.special", { fg = c.ember; })
hl("@string.special.url", { fg = c.frost; underline = true; })
hl("@string.special.path", { fg = c.frost; })
hl("@character", { fg = c.sap; })
hl("@character.special", { fg = c.ember; })

-- functions. Brass is the lightest thing in the palette because a call is
-- what you scan a file for.
hl("@function", { fg = c.brass; })
hl("@function.builtin", { fg = c.brass; })
hl("@function.call", { fg = c.brass; })
hl("@function.method", { fg = c.brass; })
hl("@function.method.call", { fg = c.brass; })
hl("@function.macro", { fg = c.brass; })
hl("@constructor", { fg = c.frost; })

-- keywords
hl("@keyword", { fg = c.cinder; })
hl("@keyword.function", { fg = c.cinder; })
hl("@keyword.operator", { fg = c.cinder; })
hl("@keyword.import", { fg = c.cinder; })
hl("@keyword.type", { fg = c.cinder; })
hl("@keyword.modifier", { fg = c.cinder; })
hl("@keyword.repeat", { fg = c.cinder; })
hl("@keyword.conditional", { fg = c.cinder; })
hl("@keyword.conditional.ternary", { fg = c.fg_dim; })
hl("@keyword.exception", { fg = c.cinder; })
hl("@keyword.coroutine", { fg = c.cinder; })
hl("@keyword.debug", { fg = c.error; })
hl("@keyword.directive", { fg = c.cinder; })
hl("@keyword.directive.define", { fg = c.cinder; })
hl("@keyword.return", { fg = c.cinder; })
hl("@label", { fg = c.cinder; })

-- types. frost is the dimmest and least saturated thing here, so a type
-- annotation sits behind the code it annotates instead of in front of it.
hl("@type", { fg = c.frost; })
hl("@type.builtin", { fg = c.frost; })
hl("@type.definition", { fg = c.frost; })
hl("@attribute", { fg = c.ember; })
hl("@attribute.builtin", { fg = c.ember; })
hl("@module", { fg = c.fg; })
hl("@module.builtin", { fg = c.fg; })

-- operators, punctuation: quiet on purpose
hl("@operator", { fg = c.fg_dim; })
hl("@punctuation.delimiter", { fg = c.fg_dim; })
hl("@punctuation.bracket", { fg = c.fg_dim; })
hl("@punctuation.special", { fg = c.ember; })

-- comments
hl("@comment", { fg = c.comment; })
hl("@comment.documentation", { fg = c.comment; })
hl("@comment.error", { fg = c.bg0; bg = c.error; bold = true; })
hl("@comment.warning", { fg = c.bg0; bg = c.warn; bold = true; })
hl("@comment.todo", { fg = c.bg0; bg = c.info; bold = true; })
hl("@comment.note", { fg = c.bg0; bg = c.hint; bold = true; })

-- markup. Six heading levels out of five pigments, so the last one steps
-- down to fg_dim rather than repeating a pigment.
hl("@markup", { fg = c.fg; })
hl("@markup.strong", { bold = true; })
hl("@markup.italic", { italic = true; })
hl("@markup.strikethrough", { strikethrough = true; })
hl("@markup.underline", { underline = true; })
hl("@markup.heading", { fg = c.ember; bold = true; })
hl("@markup.heading.1", { fg = c.ember; bold = true; })
hl("@markup.heading.2", { fg = c.brass; bold = true; })
hl("@markup.heading.3", { fg = c.frost; bold = true; })
hl("@markup.heading.4", { fg = c.sap; bold = true; })
hl("@markup.heading.5", { fg = c.cinder; bold = true; })
hl("@markup.heading.6", { fg = c.fg_dim; bold = true; })
hl("@markup.quote", { fg = c.comment; italic = true; })
hl("@markup.math", { fg = c.sap; })
hl("@markup.link", { fg = c.frost; })
hl("@markup.link.label", { fg = c.frost; })
hl("@markup.link.url", { fg = c.comment; underline = true; })
hl("@markup.raw", { fg = c.sap; })
hl("@markup.raw.block", { fg = c.sap; })
hl("@markup.list", { fg = c.ember; })
hl("@markup.list.checked", { fg = c.ok; })
hl("@markup.list.unchecked", { fg = c.comment; })

-- tags (html, jsx, svelte, vue). An attribute is a field, so it is ember.
hl("@tag", { fg = c.cinder; })
hl("@tag.builtin", { fg = c.cinder; })
hl("@tag.attribute", { fg = c.ember; })
hl("@tag.delimiter", { fg = c.fg_dim; })

-- diff
hl("@diff.plus", { fg = c.ok; })
hl("@diff.minus", { fg = c.error; })
hl("@diff.delta", { fg = c.info; })

-- misc
hl("@none", { fg = c.fg; })
hl("@error", { fg = c.error; })
