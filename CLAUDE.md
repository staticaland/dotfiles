# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed using GNU `stow` for symlinking configuration files. The parent directory should be `$HOME` when using stow commands.

## Key Architecture

### Stow-based Configuration Management

- Each directory (nvim, fish, ghostty, etc.) contains configuration files in their expected directory structure
- Use `stow nvim` to symlink everything inside the nvim folder to the parent directory
- All configurations are organized to match their target locations in the home directory
