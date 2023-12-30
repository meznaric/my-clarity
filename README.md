# My-Clarity - Neovim Colorscheme - Alpha

The idea is simple. The more important a piece of code is the more obvious it should be (brighter, bolder, saturated). In my opinion this means control flow statements such as `if`, `else`, `while`, `return`, function calls... should be the most obvious as they affect how the code "flows". These are bold and white.

On top of that I wanted:

 - Sensible defaults (errors are red, git diffs are green/red...)
 - Hight contrast (I don't always work in darkness)
 - Fewer colors > many colors (I find it hard to make sense of rainbow other colorschemes provide)

**I mainly use TypeScript and my own set of plugins, so it may not work for you, but I will happily accept contributions. Hence the alpha.** See [Contributing](#contributions) below.

### Features:

 - Always expected defaults (based of neovim 0.10 default colorscheme):
    - Red errors, orange warnings, ...
    - Added lines are green, removed lines are red, ...
 - 100s of variations to choose from. VIEW PRESETS HERE
 - ❄️🍃☀️🍂 - Changes every day a little bit to match the color of the season
   - Maintains the color hirearchy so you don't get lost as the colors change over time
 - Easily get `tetriadic`/`complementary`/`analogous` color schemes
   - See [presets](/lua/my-clarity/presets.lua)
     - `default` | `analogous` | `complementary` | `triadic` | `new_year` | `summer` | `halloween` | `spring` | `autumn` | `winter` | `dynamic_analogous` | `dynamic_complementary`
   - See color options below

### Install

This colorscheme does a bit more than just set colors. It uses `meznaric/ts-controlflow-queries` under the hood to update tree sitter queries so we can target control flow statements (loops, conditions, returns...).

Install the plugin with your favourite plugin manager
```lua
{
    dir = "meznaric/my-clarity",
    priority = 1000, -- make sure to load this before all the other start plugins
    dependencies = {
        -- Provides lua theme workflow + bunch of useful helper functions for color modifications
        "rktjmp/lush.nvim",
        -- Treesitter is a dependency if you use `ts_controflow_queries`
        "nvim-treesitter/nvim-treesitter"
        -- Defines a new highlight group @control_flow that this color scheme was designed to work with
        "nvim-controlflow-queries"
    },
	---@type MyClarityConfig
    -- opts = {}, -- Customize your config
},
```

### Config reference
You can modify the config and pass it into `opts`
```lua
-- This is the default config, and it is not needed
{
    
    keymaps = true,
    disable_semantic_tokens = true
    -- See color options below for all options
    color_mode = "dynamic",
    first_offset = 120,
    second_offset = -60
},
```

#### Color Options

Based on 4 main colors:

1. Control flow statements (aways white, bold, most obvious)
2. Other code (base_hue)
3. Types & supporting information (first_hue / first_offset)
4. Comments (second_hue, second_offset)

Fixed colors:
```
{
  color_mode = "fixed",
  base_hue = 123,  -- Main code
  first_hue = 234, -- Types & supporting info
  second_hue = 345 -- Comments
}
```

Dynamic (changes every day by a little bit)
```
{
  color_mode = "dynamic",
  first_offset = 60,        -- Types & supporting info
  second_offset = -60       -- Comments
}
```

Color of a specific day
```
{
  color_mode = "by_day",
  day = 32,                 -- 1st of February
  first_offset = 60,        -- Types & supporting info
  second_offset = -60       -- Comments
}
```

Simple presets
```
{
  color_mode = "preset",
  preset_name = "winter"
}
```

#### Keymaps

Keymaps are intended to help you find the color combination you are after. I enabled it at the beginning, chose my preset and disabled them.

You can pass in `true` to enable the default, `false` to disable keymaps, or Dictionary to configure it your own way:
```
keymaps = {
  "next_preset" = "<leader>b",
  "next_day" = "<leader>n",
  "next_month" = "<leader>m"
}
```

## Contributing

### Modifying colorscheme

1. Clone the repo
2. Update plugin install directory to `dir = "~/Projects/editor-plugins/my-clarity/"
1. Open `lua/lush_theme/my-clarity-2.lua`
2. Scroll to bottom and change __DEV to true
3. Use `:Lushify` command to enable dynamic dev mode (you can change colors and see the changes)
4. Open the file that is not working as you would expect
5. Position the cursor where you want, write `:Inspect`
6. Go back to my-clarity-2.lua and update the corresponding color group

### Modifying treesitter queries

Is your language not correctly detecting control flow statements? 

Please contribute to `meznaric/ts-controlflow-queries`.

### Credit

Huge credit to lush.nvim to make this possible and easy to implement.
