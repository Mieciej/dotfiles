local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "NLKNguyen/papercolor-theme",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "ray-x/lsp_signature.nvim",
  { 'echasnovski/mini.completion', version = '*' },
  { 'echasnovski/mini.diff', version = '*' },
  "nvim-treesitter/nvim-treesitter",
})


require("mini.completion").setup({
  window = {
    info = {height= 0, width =0},
    signature = {height= 0, width =0},
  }
})

require("mini.diff").setup({
  view = {
    signs = {add='+', change='~', delete='-'}
  }
}
)
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,                  -- false will disable the whole extension
  },
  indent = {
    enable = true,                  -- Enable indentation based on Tree-sitter
  },
}
