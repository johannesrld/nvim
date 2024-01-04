# My Neovim config

There are many config but this one is mine

If you want to use this:

1. Dont, this WILL break sometimes

2. You'll need a couple requirements, namely these commands:
  - "gcc" (The GNU Compiler Collection)
  - "g++" (GCC's C++ Compiler)
  - "make"
  - "cargo" (rust compilation/project management)
  - "npm" (Node package manager)
  - "rg" (Ripgrep)
  - "node" (Nodejs)
  - "ghcup" (Glasgow Haskell Compiler installer)

These should already be on your system, but just double check
- "tar"
- "gzip"
- "unzip"

if you are missing any of these commands the config will stop loading itself and leave
you with a default neovim configuration


I'd also recommend checking out `keymap.lua` to get a feel for the keybindings
