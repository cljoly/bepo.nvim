-- The assumption is that this file will be used as configuration file with nvim
-- running from the root of the repository
vim.opt.runtimepath:append(vim.fn.getcwd())

require("bepo").setup()
