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
---
{{< github_badge >}}

{{< rawhtml >}}
<div class="badges">
{{< /rawhtml >}}
end_insert -->
<!-- remove -->
# ⌨️ bepo.nvim
<!-- end_remove -->

![Neovim version](https://img.shields.io/badge/Neovim-0.5-57A143?style=flat&logo=neovim) [![](https://img.shields.io/badge/powered%20by-riss-lightgrey)](https://cj.rs/riss) ![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/cljoly/bepo.nvim?color=darkgreen&sort=semver) ![Endpoint Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fd.cj.rs%2Fnvim%2Fbepo.json&cacheSeconds=90000)

<!-- insert
{{< rawhtml >}}
</div>
{{< /rawhtml >}}
end_insert -->

Mappings for the [bepo][] layout in Lua, inspired by [vim-bepo][vb]

It aims to be faster (takes only 0.4ms at startup on my machine, while [vim-bepo][vb] requires 1.6ms) and more customizable (see `:help bepo.nvim-cherry-pick`)

## Installation

Add the plugin `cljoly/bepo.nvim` to your package manager.

If you don’t have a package manager yet, I use [paq.nvim][paq].
You can give it a try :).   
Look at the [installation instructions][paq_install] and then add the following to your config:
```lua
require "paq" {
  "cljoly/bepo.nvim",
  -- ... other packages
}
```

Then restart neovim and run `PaqInstall`. That will install the bepo.nvim plugin.

## Usage

Once the plugin is installed, you can add a call to set up the bepo mappings to your config:

``` lua
require("bepo").setup()
```
You should call the extension early in your `init.lua`, so that you can erase mappings later (or with other extensions) more easily.

## Advanced Usage

You can also apply only some mapping groups:
``` lua
require("bepo").movement()
require("bepo").tabs()
require("bepo").easy_access()
require("bepo").window()
```

See [the help file][help] for more details and the mappings installed.

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

[bepo]: https://bepo.fr/
[help]: https://github.com/cljoly/bepo.nvim/blob/main/doc/bepo-nvim.txt
[paq]: https://github.com/savq/paq-nvim
[paq_install]: https://github.com/savq/paq-nvim?tab=readme-ov-file#installation
[vb]: https://github.com/michamos/vim-bepo
