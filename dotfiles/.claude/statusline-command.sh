#!/bin/sh
# Claude Code status line — styled after Powerlevel10k (dir + vcs + model | context)
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_day_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd=$(echo "$cwd" | sed "s|^$home|~|")

# Git branch + dirty state (skip optional locks to avoid blocking)
branch=""
dirty=""
if git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
    || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$(git -C "$cwd" status --porcelain 2>/dev/null)" ]; then
    dirty="*"
  fi
fi

# Build left segment: dir + git branch (yellow when dirty, green when clean)
left=""
if [ -n "$branch" ]; then
  git_icon="on"
  if [ -n "$dirty" ]; then
    left=$(printf "\033[34m%s\033[0m \033[33m%s %s%s\033[0m" "$short_cwd" "$git_icon" "$branch" "$dirty")
  else
    left=$(printf "\033[34m%s\033[0m \033[32m%s %s\033[0m" "$short_cwd" "$git_icon" "$branch")
  fi
else
  left=$(printf "\033[34m%s\033[0m" "$short_cwd")
fi

# Build right segment: model + context usage + rate limits
right=""
[ -n "$model" ] && right="$model"

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  right="$right  ctx:${used_int}%"
fi

if [ -n "$five_hour" ]; then
  five_hour_int=$(printf "%.0f" "$five_hour")
  right="$right  5h:${five_hour_int}%"
  if [ -n "$five_hour_reset" ]; then
    remaining=$(( ${five_hour_reset%.*} - $(date +%s) ))
    if [ "$remaining" -gt 0 ]; then
      hrs=$(( remaining / 3600 ))
      mins=$(( (remaining % 3600) / 60 ))
      right="$right(→${hrs}hr${mins}min)"
    fi
  fi
fi

if [ -n "$seven_day" ]; then
  seven_day_int=$(printf "%.0f" "$seven_day")
  right="$right  7d:${seven_day_int}%"
  if [ -n "$seven_day_reset" ]; then
    remaining=$(( ${seven_day_reset%.*} - $(date +%s) ))
    if [ "$remaining" -gt 0 ]; then
      days=$(( remaining / 86400 ))
      hrs=$(( (remaining % 86400) / 3600 ))
      right="$right(→${days}d${hrs}hr)"
    fi
  fi
fi

[ -n "$right" ] && right=$(printf "\033[90m%s\033[0m" "$right")

# Print with spacing between left and right
if [ -n "$right" ]; then
  printf "%b  %b" "$left" "$right"
else
  printf "%b" "$left"
fi
