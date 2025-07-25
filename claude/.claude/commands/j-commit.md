---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
description: Create git commits
---

## Context

Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Commit

Always split large changes into small, atomic commits. Each commit should be the smallest meaningful unit of change that makes sense on its own. If you're tempted to use "and" in your commit message, it should probably be multiple commits.

## Conventional commits

Follow the [Conventional Commits specification](https://www.conventionalcommits.org) for commits.

## Your task

Based on the above changes, create a small atomic git commit.
