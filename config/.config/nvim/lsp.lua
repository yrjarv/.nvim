-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set default config for all servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Define keymaps on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K',     vim.lsp.buf.hover,           opts)
    vim.keymap.set('n', 'gd',    vim.lsp.buf.definition,      opts)
    vim.keymap.set('n', 'gD',    vim.lsp.buf.declaration,     opts)
    vim.keymap.set('n', 'gi',    vim.lsp.buf.implementation,  opts)
    vim.keymap.set('n', 'go',    vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr',    vim.lsp.buf.references,      opts)
    vim.keymap.set('n', 'gs',    vim.lsp.buf.signature_help,  opts)
    vim.keymap.set('n', '<F2>',  vim.lsp.buf.rename,          opts)
    vim.keymap.set('n', '<F3>',  function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<F4>',  vim.lsp.buf.code_action,     opts)

    -- Diagnostics on hover
    vim.o.updatetime = 250
    vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
  end,
})

-- Setup completion
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.Item,
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Esc>'] = function(fallback)
      if cmp.visible() then
        cmp.abort()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
          'n',
          false
        )
      else
        fallback()
      end
    end,
  }),
})

-- Enable servers
local servers = {
  "lua_ls",
  "clangd",
  "rust_analyzer",
  "pyright",
  "ts_ls",
  "jdtls",
  "kotlin_language_server",
  "sqls",
}

for _, name in ipairs(servers) do
  vim.lsp.config(name, {})  -- define config
  vim.lsp.enable(name)      -- start/enable server
end

-- Optional hack for Rust (if your setup needs it)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.lsp.enable("rust_analyzer")
  end,
})
