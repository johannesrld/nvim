---I dont like neovims default way of settings keybinds so this is basically what ive come up with

---@class this

---@alias mode "n" | "i" | "v" | "x"

---@class keybindSpecValue
---@field mode? mode | mode[]
---@field noremap? boolean
---@field silent? boolean
---@field [1] function | string
---@field [2]? function


---@class keybindSpec
---@field [1] table | nil
---@field [string] keybindSpecValue | function


---@param keybinds keybindSpec
return function(keybinds)
  local defaultOpts = keybinds[1] or {}
  table.remove(keybinds, 1)
  for keybind, spec in pairs(keybinds) do
    if type(spec) == "function" then
      vim.keymap.set("n", keybind, spec, defaultOpts)
    else
      local desc
      local callback
      if type(spec[1]) == "string" then
        ---@type string
        desc = spec[1]
        ---@type function
        callback = spec[2]
      else
        ---@type function
        callback = spec[1]
      end
      vim.keymap.set(spec.mode or "n", keybind, callback, vim.tbl_extend('force', defaultOpts,
        {
          desc = desc or defaultOpts.desc,
          silent = spec.silent or defaultOpts.silent,
          callback = nil
        }))
    end
    ::cont::
  end
end
