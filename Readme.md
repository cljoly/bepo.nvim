# bepo.nvim

*Work in progress, see the [sources](https://github.com/cljoly/bepo.nvim/blob/main/fnl/bepo.fnl)*

Remap for the bepo layout in Lua, inspired from https://github.com/michamos/vim-bepo

It aims to be faster (takes only 0.4ms at startup on my machine, while vim-bepo requires 1.6ms)

## Example Use Case

You should call the extension early in your config, so that you can erase mappings later (or with later extensions) more easily.

``` lua
require("bepo").setup()
```

You can also apply only some mapping groups:
``` lua
require("bepo").movement()
require("bepo").tabs()
require("bepo").easy_access()
require("bepo").window()
```
