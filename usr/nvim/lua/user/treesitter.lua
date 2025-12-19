-- gpt wrote it too

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "rust", "python", "lua" },
  highlight = { enable = true },
  indent = { enable = true },
}
