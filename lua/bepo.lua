local function mapping_movement()
  do
    vim.api.nvim_set_keymap("n", "c", "h", {noremap = true})
    vim.api.nvim_set_keymap("o", "c", "h", {noremap = true})
    vim.api.nvim_set_keymap("x", "c", "h", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "t", "j", {noremap = true})
    vim.api.nvim_set_keymap("o", "t", "j", {noremap = true})
    vim.api.nvim_set_keymap("x", "t", "j", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "s", "k", {noremap = true})
    vim.api.nvim_set_keymap("o", "s", "k", {noremap = true})
    vim.api.nvim_set_keymap("x", "s", "k", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "r", "l", {noremap = true})
    vim.api.nvim_set_keymap("o", "r", "l", {noremap = true})
    vim.api.nvim_set_keymap("x", "r", "l", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "C", "H", {noremap = true})
    vim.api.nvim_set_keymap("o", "C", "H", {noremap = true})
    vim.api.nvim_set_keymap("x", "C", "H", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "T", "J", {noremap = true})
    vim.api.nvim_set_keymap("o", "T", "J", {noremap = true})
    vim.api.nvim_set_keymap("x", "T", "J", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "S", "K", {noremap = true})
    vim.api.nvim_set_keymap("o", "S", "K", {noremap = true})
    vim.api.nvim_set_keymap("x", "S", "K", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "R", "L", {noremap = true})
    vim.api.nvim_set_keymap("o", "R", "L", {noremap = true})
    vim.api.nvim_set_keymap("x", "R", "L", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "gt", "gj", {noremap = true})
    vim.api.nvim_set_keymap("o", "gt", "gj", {noremap = true})
    vim.api.nvim_set_keymap("x", "gt", "gj", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "gs", "gk", {noremap = true})
    vim.api.nvim_set_keymap("o", "gs", "gk", {noremap = true})
    vim.api.nvim_set_keymap("x", "gs", "gk", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "zT", "zt", {noremap = true})
    vim.api.nvim_set_keymap("o", "zT", "zt", {noremap = true})
    vim.api.nvim_set_keymap("x", "zT", "zt", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "zt", "zj", {noremap = true})
    vim.api.nvim_set_keymap("o", "zt", "zj", {noremap = true})
    vim.api.nvim_set_keymap("x", "zt", "zj", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "zk", "zs", {noremap = true})
    vim.api.nvim_set_keymap("o", "zk", "zs", {noremap = true})
    vim.api.nvim_set_keymap("x", "zk", "zs", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "zs", "zk", {noremap = true})
    vim.api.nvim_set_keymap("o", "zs", "zk", {noremap = true})
    vim.api.nvim_set_keymap("x", "zs", "zk", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "h", "t", {noremap = true})
    vim.api.nvim_set_keymap("o", "h", "t", {noremap = true})
    vim.api.nvim_set_keymap("x", "h", "t", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "H", "T", {noremap = true})
    vim.api.nvim_set_keymap("o", "H", "T", {noremap = true})
    vim.api.nvim_set_keymap("x", "H", "T", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "l", "c", {noremap = true})
    vim.api.nvim_set_keymap("o", "l", "c", {noremap = true})
    vim.api.nvim_set_keymap("x", "l", "c", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "L", "C", {noremap = true})
    vim.api.nvim_set_keymap("o", "L", "C", {noremap = true})
    vim.api.nvim_set_keymap("x", "L", "C", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "j", "r", {noremap = true})
    vim.api.nvim_set_keymap("o", "j", "r", {noremap = true})
    vim.api.nvim_set_keymap("x", "j", "r", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "J", "R", {noremap = true})
    vim.api.nvim_set_keymap("o", "J", "R", {noremap = true})
    vim.api.nvim_set_keymap("x", "J", "R", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "k", "s", {noremap = true})
    vim.api.nvim_set_keymap("o", "k", "s", {noremap = true})
    vim.api.nvim_set_keymap("x", "k", "s", {noremap = true})
  end
  vim.api.nvim_set_keymap("n", "K", "S", {noremap = true})
  do
    vim.api.nvim_set_keymap("o", "K", "S", {noremap = true})
    vim.api.nvim_set_keymap("x", "K", "S", {noremap = true})
  end
  return nil
end
local function mapping_tabs()
  vim.api.nvim_set_keymap("n", "gb", "gT", {noremap = true})
  vim.api.nvim_set_keymap("n", "g\195\169", "gt", {noremap = true})
  vim.api.nvim_set_keymap("n", "gB", ":execute \"silent! tabfirst\"<CR>", {noremap = true})
  vim.api.nvim_set_keymap("n", "g\195\137", ":execute \"silent! tablast\"<CR>", {noremap = true})
  return vim.api.nvim_set_keymap("n", "gT", "<C-]>", {noremap = true})
end
local function mapping_easy_access()
  vim.api.nvim_set_keymap("n", "\194\171", "<", {noremap = true})
  vim.api.nvim_set_keymap("v", "\194\171", "<gv", {noremap = true})
  vim.api.nvim_set_keymap("n", "\194\187", ">", {noremap = true})
  vim.api.nvim_set_keymap("v", "\194\187", ">gv", {noremap = true})
  do
    vim.api.nvim_set_keymap("n", "g,", "g;", {noremap = true})
    vim.api.nvim_set_keymap("o", "g,", "g;", {noremap = true})
    vim.api.nvim_set_keymap("x", "g,", "g;", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "g;", "g,", {noremap = true})
    vim.api.nvim_set_keymap("o", "g;", "g,", {noremap = true})
    vim.api.nvim_set_keymap("x", "g;", "g,", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "\195\169", "w", {noremap = true})
    vim.api.nvim_set_keymap("o", "\195\169", "w", {noremap = true})
    vim.api.nvim_set_keymap("x", "\195\169", "w", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "\195\137", "W", {noremap = true})
    vim.api.nvim_set_keymap("o", "\195\137", "W", {noremap = true})
    vim.api.nvim_set_keymap("x", "\195\137", "W", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("o", "a\195\169", "aw", {noremap = true})
    vim.api.nvim_set_keymap("x", "a\195\169", "aw", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("o", "a\195\137", "aW", {noremap = true})
    vim.api.nvim_set_keymap("x", "a\195\137", "aW", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("o", "i\195\169", "iw", {noremap = true})
    vim.api.nvim_set_keymap("x", "i\195\169", "iw", {noremap = true})
  end
  vim.api.nvim_set_keymap("o", "i\195\137", "iW", {noremap = true})
  vim.api.nvim_set_keymap("x", "i\195\137", "iW", {noremap = true})
  return nil
end
local function mapping_window()
  vim.api.nvim_set_keymap("n", "w", "<C-w>", {noremap = true})
  vim.api.nvim_set_keymap("n", "W", "<C-w><C-w>", {noremap = true})
  vim.api.nvim_set_keymap("n", "wc", "<C-w>h", {noremap = true})
  vim.api.nvim_set_keymap("n", "wt", "<C-w>j", {noremap = true})
  vim.api.nvim_set_keymap("n", "ws", "<C-w>k", {noremap = true})
  vim.api.nvim_set_keymap("n", "wr", "<C-w>l", {noremap = true})
  vim.api.nvim_set_keymap("n", "wC", "<C-w>H", {noremap = true})
  vim.api.nvim_set_keymap("n", "wT", "<C-w>J", {noremap = true})
  vim.api.nvim_set_keymap("n", "wS", "<C-w>K", {noremap = true})
  vim.api.nvim_set_keymap("n", "wR", "<C-w>L", {noremap = true})
  vim.api.nvim_set_keymap("n", "wh", "<C-w>s", {noremap = true})
  vim.api.nvim_set_keymap("n", "w\195\169", "<C-w>t", {noremap = true})
  return vim.api.nvim_set_keymap("n", "w\195\137", "<C-w>T", {noremap = true})
end
local function setup()
  if (vim.g.loaded_bepo_nvim == nil) then
    mapping_movement()
    mapping_tabs()
    mapping_easy_access()
    mapping_window()
    vim.g.loaded_bepo_nvim = 1
    return nil
  else
    return nil
  end
end
return {setup = setup, movement = mapping_movement, tabs = mapping_tabs, easy_access = mapping_easy_access, window = mapping_window}
