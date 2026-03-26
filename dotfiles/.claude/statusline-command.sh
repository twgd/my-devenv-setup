#!/bin/sh
# Claude Code status line — styled after Powerlevel10k (dir + vcs + model | context)
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd=$(echo "$cwd" | sed "s|^$home|~|")

# Git branch (skip optional locks to avoid blocking)
branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

# Build left segment: dir + git branch
left=""
if [ -n "$branch" ]; then
  git_icon="on"
  left=$(printf "\033[34m%s\033[0m \033[32m%s %s\033[0m" "$short_cwd" "$git_icon" "$branch")
else
  left=$(printf "\033[34m%s\033[0m" "$short_cwd")
fi

# Build right segment: model + context usage
right=""
if [ -n "$model" ] && [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  right=$(printf "\033[90m%s  ctx:%s%%\033[0m" "$model" "$used_int")
elif [ -n "$model" ]; then
  right=$(printf "\033[90m%s\033[0m" "$model")
fi

# Print with spacing between left and right
if [ -n "$right" ]; then
  printf "%b  %b" "$left" "$right"
else
  printf "%b" "$left"
fi
