local lualine = require("lualine")
-- stylua: ignore
local colors = {
  bg       = "#1f1d2e",
  fg       = '#e0def4',
  yellow   = '#f6c177',
  cyan     = '#9ccfd8',
  darkblue = '#6e6a86',
  violet   = '#c4a7e7',
  blue     = '#31748f',
  green    = '#31748f',
  orange   = '#f7c177',
  red      = '#eb6f92',
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand("%:t")) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}
-- Config
local config = {
  options = {
    theme = "rose-pine",
    icons_enabled = false,
    component_separators = "",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component) table.insert(config.sections.lualine_c, component) end

local function ins_right(component) table.insert(config.sections.lualine_x, component) end

ins_left {
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg, gui = "bold" },
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg },
}

ins_left { "location", color = { fg = colors.fg, gui = "bold" } }

ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = "X ", warn = "! ", info = "I ", hint = "H " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}
ins_left {
  function() return "%=" end,
}

ins_right {
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.green, gui = "bold" },
}

ins_right {
  "branch",
  icon = "B",
  color = { fg = colors.yellow, gui = "bold" },
}

ins_right {
  "diff",
  symbols = { added = "+", modified = "*", removed = "-" },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}
lualine.setup(config)
