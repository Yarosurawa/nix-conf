
-- LSP

vim.lsp.enable('ts_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('emmet_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('clangd')

vim.lsp.enable('rust_analyzer');
vim.lsp.enable('pyright');
vim.lsp.enable('clangd');

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
})

require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    vue = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end)


local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp

require("bufferline").setup({})

vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

require("neo-tree").setup({
	source_selector = {
		winbar = true,
		statusline = true
	}
})

require("notify").setup({ })
vim.notify = require("notify")

require("noice").setup({})

require('lualine').setup({
	options = {
		theme = "gruvbox-material",
	}
})

require("autoclose").setup({})

require("ibl").setup({
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
  },
})
