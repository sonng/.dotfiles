# .dotfiles

## Requires

- stow
- ripgrep
- fzf
- fd-find
- pynvim (python): `pip install pynvim`
- tree-sitter-cli (rust): `cargo install tree-sitter-cli`
- [NERD font](https://www.nerdfonts.com/font-downloads)

## Tooling

- [mise](https://github.com/jdx/mise): dev tools, env vars, task runner
- [zellij](https://github.com/zellij-org/zellij): terminal multiplexer with batteries
- [starship-rs](https://github.com/starship/starship): custom cli prompt

## Setup dotfiles

```
stow -vv */
```

## Keeping Rust installs up to date

- [cargo-update](https://crates.io/crates/cargo-update): `cargo install-update -a`
