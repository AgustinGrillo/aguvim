# Repository Guidelines

- Keep the root `init.lua` minimal. It should only require configuration modules in startup order; do not place implementation details there.
- Keep `lua/lazy-config/init.lua` focused on plugin declarations, dependencies, versions, build commands, and loading metadata.
- Put each plugin's runtime configuration in a dedicated module under `lua/<area>-config/`, then load it explicitly from the root `init.lua` after `lazy-config`.
- Startup configuration modules should configure themselves when required. Keep root entries uniform as `require('module')`; do not expose or call `.setup()` from `init.lua` unless deferred or parameterized initialization is genuinely needed.
- Follow the existing directory and naming conventions before introducing a new structure.
- Preserve compatibility with both macOS and Linux. Do not depend on Homebrew, platform-specific absolute paths, or a particular system package manager.
- Document required external executables in `README.md` using package-manager-neutral instructions; keep optional dependencies clearly marked.
- Target Neovim 0.12 or newer and avoid deprecated APIs.
- After configuration changes, run `git diff --check` and a headless Neovim startup check. Run the relevant `:checkhealth` section when changing plugins, parsers, providers, or LSP configuration.
