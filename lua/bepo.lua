local function map_text_object(key, target)
  vim.api.nvim_set_keymap("o", key, target, {noremap = true})
  vim.api.nvim_set_keymap("x", key, target, {noremap = true})
  return nil
end
local function map_visual(key, target)
  vim.api.nvim_set_keymap("x", key, target, {noremap = true})
  return nil
end
local function map_normal(key, target)
  vim.api.nvim_set_keymap("n", key, target, {noremap = true})
  return nil
end
local function map_all(key, target)
  map_normal(key, target)
  return map_text_object(key, target)
end
local function mapping_movement()
  map_all("c", "h")
  map_all("t", "j")
  map_all("s", "k")
  map_all("r", "l")
  map_all("C", "H")
  map_all("T", "J")
  map_all("S", "K")
  map_all("R", "L")
  map_all("gt", "gj")
  map_all("gs", "gk")
  map_all("zT", "zt")
  map_all("zt", "zj")
  map_all("zk", "zs")
  map_all("zs", "zk")
  map_all("h", "t")
  map_all("H", "T")
  map_all("l", "c")
  map_all("L", "C")
  map_all("j", "r")
  map_all("J", "R")
  map_all("k", "s")
  return map_all("K", "S")
end
local function mapping_tabs()
  map_normal("gb", "gT")
  map_normal("g\195\169", "gt")
  map_normal("gB", ":execute \"silent! tabfirst\"<CR>")
  map_normal("g\195\137", ":execute \"silent! tablast\"<CR>")
  return map_normal("gT", "<C-]>")
end
local function mapping_easy_access()
  map_normal("\194\171", "<")
  map_visual("\194\171", "<gv")
  map_normal("\194\187", ">")
  map_visual("\194\187", ">gv")
  map_all("g,", "g;")
  map_all("g;", "g,")
  map_all("\195\169", "w")
  map_all("\195\137", "W")
  map_text_object("a\195\169", "aw")
  map_text_object("a\195\137", "aW")
  map_text_object("i\195\169", "iw")
  return map_text_object("i\195\137", "iW")
end
local function mapping_window()
  map_normal("w", "<C-w>")
  map_normal("W", "<C-w><C-w>")
  map_normal("wc", "<C-w>h")
  map_normal("wt", "<C-w>j")
  map_normal("ws", "<C-w>k")
  map_normal("wr", "<C-w>l")
  map_normal("wC", "<C-w>H")
  map_normal("wT", "<C-w>J")
  map_normal("wS", "<C-w>K")
  map_normal("wR", "<C-w>L")
  map_normal("wh", "<C-w>s")
  map_normal("w\195\169", "<C-w>t")
  return map_normal("w\195\137", "<C-w>T")
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
