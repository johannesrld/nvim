(fn [keybinds]
  (local default-opts (or (. keybinds 1) {}))
  (table.remove keybinds 1)

  (each [keybind spec (pairs keybinds)]
    (if (= (type spec) "function")
        (vim.keymap.set :n keybind spec default-opts)
        (let [desc     (if (= (type (. spec 1)) :string) (. spec 1) nil)
              callback (if (= (type (. spec 1)) :function) (. spec 1) (. spec 2))
              options  (vim.tbl_extend :force default-opts {:desc   (or desc default-opts.desc)
                                                            :silent (or spec.silent default-opts.silent)})]
          (vim.keymap.set (or spec.mode :n) keybind callback options)))))
         
