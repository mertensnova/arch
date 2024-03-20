local present, decay = pcall(require, 'decay')

if not present then
  error('Can\'t import decay, make sure u installed it! :v')
end

decay.setup({
  style = 'decayce',
    italics = {
  code = true,
    comments = true -- to disable italic comments, replace to true to enable
  },
  nvim_tree = {
    contrast = true, -- or false to disable tree contrast
  },
})


--vim.cmd[[colorscheme dracula-soft]]
--vim.cmd 'colorscheme nightfox'
--vim.cmd 'colorscheme monochrome'
