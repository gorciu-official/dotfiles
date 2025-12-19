-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP & completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  
  -- Telescope (fuzzy finder)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter (syntax highlighting)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Status line
  { "nvim-lualine/lualine.nvim" },
  
  -- File browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        })

        pcall(telescope.load_extension, "file_browser")

        vim.keymap.set("n", "<leader>fb", function()
            telescope.extensions.file_browser.file_browser({
                path = vim.fn.expand("%:p:h"),
                hidden = true,
                respect_gitignore = false,
            })
        end, { desc = "File Browser" })
    end,
  },
})
