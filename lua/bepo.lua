local function map_text_object(key, target)
  if (vim.fn.maprg(key, "o") == "") then
    vim.api.nvim_set_keymap("o", key, target, {noremap = true})
  elseif (vim.fn.maprg(key, "x") == "") then
    vim.api.nvim_set_keymap("x", key, target, {noremap = true})
  else
  end
  return nil
end
local function map_all(key, target)
  if (vim.fn.maprg(key, "n") == "") then
    return vim.api.nvim_set_keymap("n", key, target, {noremap = true})
  else
    return map_text_object(key, target)
  end
end
local function setup()
  return map_all("c", "h")
end
return {setup = setup}
