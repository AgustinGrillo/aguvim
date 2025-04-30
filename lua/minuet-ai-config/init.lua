require('minuet').setup {
    virtualtext = {
        auto_trigger_ft = { '*' },
        keymap = {
            -- accept whole completion
            accept = '<A-S-Tab>',
            -- accept one line
            accept_line = '<S-Tab>',
        },
    },
    provider = 'openai_fim_compatible',
    n_completions = 1, -- recommend for local model for resource saving
    -- I recommend beginning with a small context window size and incrementally
    -- expanding it, depending on your local computing power. A context window
    -- of 512, serves as an good starting point to estimate your computing
    -- power. Once you have a reliable estimate of your local computing power,
    -- you should adjust the context window to a larger value.
    context_window = 1024,
    notify = 'debug',
    provider_options = {
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:3b',
            optional = {
                max_tokens = 256,
                top_p = 0.9,
            },
        },
    },
}
