local nuls = require("null-ls")

nuls.setup({
    sources = {
        nuls.builtins.formatting.stylua,
        nuls.builtins.formatting.black.with { extra_args = { "--fast" } },
        nuls.builtins.diagnostics.black,
        nuls.builtins.completion.spell,
    },
})