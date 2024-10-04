local function _1_()
  return vim.cmd("colorscheme gruber-darker")
end
return {{"echasnovski/mini.statusline", opts = {set_vim_settings = false, use_icons = false}, version = false}, {"rose-pine/neovim", name = "rose-pine"}, {"johannesrld/plan-gruber", init = _1_}, {"ellisonleao/gruvbox.nvim", config = true, opts = {italic = {comments = false, emphasis = false, strikethrough = false, strings = false}, contrast = "hard"}}}