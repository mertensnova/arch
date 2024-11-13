
vim.opt.background = "dark" -- set this to dark or light

--vim.cmd.colorscheme("colorbuddy")
-- or
--vim.cmd.colorscheme("gruvbuddy")
--
--
local decay = require("decay")

local opt = vim.opt
local cmd = vim.cmd

--opt.background = "light"

decay.setup({
  style = "decayce",

  -- enables italics in code keywords & comments.
  italics = {
    code = true,
    comments = true,
  },

  -- enables contrast when using nvim tree.
  nvim_tree = {
    contrast = true
  },
})

cmd.colorscheme "decayce"
