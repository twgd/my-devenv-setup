# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A personal macOS development environment setup managed with **GNU Stow**. The `dotfiles/` directory mirrors the home directory structure — running `stow -t ~ .` from within `dotfiles/` creates symlinks for all configs into `~`.

## Applying Changes

```bash
# Symlink all dotfiles to home directory
cd dotfiles && stow -t ~ .

# Clone with Neovim submodule
git clone --recurse-submodules <repo-url>

# Update submodule (Neovim config)
git submodule update --remote
```

VS Code configs (`vscode/`) must be manually symlinked — they live outside the home directory stow target.

## Architecture

- **`dotfiles/`** — GNU Stow package; everything here maps to `~/` when stowed
  - `.zshrc` — Zsh config with Oh-My-Zsh, Powerlevel10k, nvm
  - `.wezterm.lua` — WezTerm terminal with custom "coolnight" color scheme
  - `.p10k.zsh` — Powerlevel10k prompt (auto-generated, avoid manual edits)
  - `.gitconfig` — Git identity, SourceTree merge/diff tool, default branch `main`
  - `.config/nvim/` — Git submodule pointing to `twgd/kickstart.nvim`
  - `.config/husky/init.sh` — Sources nvm before git hooks run
- **`vscode/`** — VS Code settings and keybindings (not stow-managed)

## Neovim Config

The Neovim config is a separate Git repo (`git@github.com:twgd/kickstart.nvim.git`) tracked as a submodule. Edit it independently and push to that repo; then update the submodule pointer here.

## Key Tool Choices

| Purpose | Tool |
|---|---|
| Terminal | WezTerm |
| Shell | Zsh + Oh-My-Zsh + Powerlevel10k |
| Editor | Neovim (primary), VS Code (secondary) |
| Node.js versions | nvm |
| Package manager | Homebrew |
| Dotfiles | GNU Stow |
| Font | MesloLGS Nerd Font Mono |
