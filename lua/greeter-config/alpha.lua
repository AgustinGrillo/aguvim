-- require'alpha'.setup(require'alpha.themes.theta'.config)

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header

-- dashboard.section.header.val = {
-- [[  ____ _____ ___  ___   __(_)___ ___ ]],
-- [[ / __ `/ __ `/ / / / | / / / __ `__ \]],
-- [[/ /_/ / /_/ / /_/ /| |/ / / / / / / /]],
-- [[\__,_/\__, /\__,_/ |___/_/_/ /_/ /_/ ]],
-- [[     /____/                          ]],
-- }
                                                   
dashboard.section.header.val = {
[[                                                   ]],
[[                                                   ]],
[[                                 __                ]],
[[   __       __   __  __  __  __ /\_\    ___ ___    ]],
[[ /'__`\   /'_ `\/\ \/\ \/\ \/\ \\/\ \ /' __` __`\  ]],
[[/\ \L\.\_/\ \L\ \ \ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
[[\ \__/.\_\ \____ \ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
[[ \/__/\/_/\/___L\ \/___/  \/__/    \/_/\/_/\/_/\/_/]],
[[            /\____/                                ]],
[[            \_/__/                                 ]],
[[                                                   ]],
[[                                                   ]],
}


-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e ~/.config/nvim <CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
