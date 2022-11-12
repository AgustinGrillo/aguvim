local nuls = require("null-ls")

nuls.setup({
    sources = {
        nuls.builtins.formatting.black.with { extra_args = { "--fast" } },
        nuls.builtins.completion.spell,
    },
})
