return function(keybinds)
  local default_opts = (keybinds[1] or {})
  table.remove(keybinds, 1)
  for keybind, spec in pairs(keybinds) do
    if (type(spec) == "function") then
      vim.keymap.set("n", keybind, spec, default_opts)
    else
      local desc
      if (type(spec[1]) == "string") then
        desc = spec[1]
      else
        desc = nil
      end
      local callback
      if (type(spec[1]) == "function") then
        callback = spec[1]
      else
        callback = spec[2]
      end
      local options = vim.tbl_extend("force", default_opts,
        { desc = (desc or default_opts.desc), silent = (spec.silent or default_opts.silent) })
      vim.keymap.set((spec.mode or "n"), keybind, callback, options)
    end
  end
  return nil
end
