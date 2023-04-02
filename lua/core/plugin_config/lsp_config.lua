require("mason").setup()

require("luasnip.loaders.from_vscode").lazy_load()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "bashls", "lua_ls", "html" }
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

require("lspconfig").pyright.setup {
    capabilities = capabilities,
}
require("lspconfig").bashls.setup {}
require("lspconfig").html.setup {
    capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
}
