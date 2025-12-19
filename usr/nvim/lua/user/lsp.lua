-- gpt wrote this don't judge me plz

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Completion
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

-- Utility to get project root
local function get_root()
  local path = vim.fn.getcwd()
  return path
end

-- Helper to start LSP
local function start_lsp(name, cmd)
  vim.lsp.start({
    name = name,
    cmd = cmd,
    root_dir = get_root(),
  })
end

-- TypeScript / JavaScript
start_lsp("ts_ls", { "typescript-language-server", "--stdio" })

-- Rust
local rust_root = vim.fs.find({"Cargo.toml"}, { upward = true })[1]
if rust_root then
    vim.lsp.start({
        name = "rust_analyzer",
        cmd = { "rust-analyzer" },
        root_dir = vim.fs.dirname(rust_root),
    })
end

-- Python
start_lsp("pyright", { "pyright-langserver", "--stdio" })
