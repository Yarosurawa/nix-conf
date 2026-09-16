
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showmatch = true

vim.opt.incsearch = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = true

vim.opt.fillchars = {
	eob = "|"
}

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.bo.buftype ~= "" then
      vim.opt_local.fillchars:append({ eob = " " })
    else
      vim.opt_local.fillchars:append({ eob = "|" })
    end
  end,
})

