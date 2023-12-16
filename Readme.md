<!-- insert
---
title: "bepo.nvim"
date: 2022-02-21T10:02:37
description: "⌨️ Mappings for the bepo layout in Lua"
repo_url: "https://github.com/cljoly/bepo.nvim"
aliases:
- /bepo.nvim
tags:
- NeoVim
- Lua
- Plugin
- Bepo
- Lisp
- Fennel
#images:
#- /telescope-repo-nvim/opengraph.png
#- /telescope-repo-nvim/opengraph.webp
---
{{< github_badge >}}

{{< rawhtml >}}
<div class="badges">
{{< /rawhtml >}}
end_insert -->
<!-- remove -->
# ⌨️ bepo.nvim
<!-- end_remove -->

![Neovim version](https://img.shields.io/badge/Neovim-0.5-57A143?style=flat&logo=neovim) [![](https://img.shields.io/badge/powered%20by-riss-lightgrey)](https://cj.rs/riss) ![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/cljoly/bepo.nvim?color=darkgreen&sort=semver)

<!-- insert
{{< rawhtml >}}
</div>
{{< /rawhtml >}}
end_insert -->

Mappings for the [bepo][] layout in Lua, inspired by [vim-bepo][vb]

It aims to be faster (takes only 0.4ms at startup on my machine, while [vim-bepo][vb] requires 1.6ms) and more customizable (see `:help bepo.nvim-cherry-pick`)

## Example Use

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

See [the help file][help] for more details and the mappings installed.

[vb]: https://github.com/michamos/vim-bepo
[help]: https://github.com/cljoly/bepo.nvim/blob/main/doc/bepo-nvim.txt
[bepo]: https://bepo.fr/

## Reporting bugs

Thanks for considering reporting a bug!

We want to know if the issue is caused by:
1. the plugin itself
2. your user configuration
3. the system configuration

Please try to reproduce the bug in nvim stripped of your user configuration by running:
```
nvim --clean -u test/mock_setup.lua
```

If you can’t reproduce the bug in that “clean” nvim instance, it suggests that the bug comes from an interaction of the plugin with your user configuration. Please feel free to open an issue, mentioning that.
