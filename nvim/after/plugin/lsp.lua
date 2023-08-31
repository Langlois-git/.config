local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- Navigate between completion item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    -- toggle completion
    ['<M-u>'] = cmp_action.toggle_completion(),

    -- navigate between snippet placeholder
    ['<C-a>'] = cmp_action.luasnip_jump_backward(),
    ['<C-d>'] = cmp_action.luasnip_jump_forward(),

    -- Confirm item
    ['<C-l>'] = cmp.mapping.confirm({select = true}),
  }
})
