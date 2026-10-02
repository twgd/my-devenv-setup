#!/bin/sh
# Claude Code status line — styled after Powerlevel10k, colors from Catppuccin Mocha (matches WezTerm theme)
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
effort=$(echo "$input" | jq -r '.effort.level // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
five_hour_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
seven_day_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Catppuccin Mocha palette (24-bit)
blue='\033[38;2;137;180;250m'    # dir
green='\033[38;2;166;227;161m'   # git clean
yellow='\033[38;2;249;226;175m'  # git dirty
mauve='\033[38;2;203;166;247m'   # model
overlay='\033[38;2;147;153;178m' # effort / rate limits (dim)
peach='\033[38;2;250;179;135m'   # context usage
reset='\033[0m'

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
    left=$(printf "%b%s%b %b%s %s%s%b" "$blue" "$short_cwd" "$reset" "$yellow" "$git_icon" "$branch" "$dirty" "$reset")
  else
    left=$(printf "%b%s%b %b%s %s%b" "$blue" "$short_cwd" "$reset" "$green" "$git_icon" "$branch" "$reset")
  fi
else
  left=$(printf "%b%s%b" "$blue" "$short_cwd" "$reset")
fi

# Build right segment: model + context usage + rate limits
right=""
[ -n "$model" ] && right=$(printf "%b%s%b" "$mauve" "$model" "$reset")
[ -n "$effort" ] && right="$right $(printf "%b(%s)%b" "$overlay" "$effort" "$reset")"

if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  right="$right  $(printf "%bctx:%s%%%b" "$peach" "$used_int" "$reset")"
fi

if [ -n "$five_hour" ]; then
  five_hour_int=$(printf "%.0f" "$five_hour")
  five_hour_str="5h:${five_hour_int}%"
  if [ -n "$five_hour_reset" ]; then
    remaining=$(( ${five_hour_reset%.*} - $(date +%s) ))
    if [ "$remaining" -gt 0 ]; then
      hrs=$(( remaining / 3600 ))
      mins=$(( (remaining % 3600) / 60 ))
      five_hour_str="${five_hour_str}(→${hrs}hr${mins}min)"
    fi
  fi
  right="$right  $(printf "%b%s%b" "$overlay" "$five_hour_str" "$reset")"
fi

if [ -n "$seven_day" ]; then
  seven_day_int=$(printf "%.0f" "$seven_day")
  seven_day_str="7d:${seven_day_int}%"
  if [ -n "$seven_day_reset" ]; then
    remaining=$(( ${seven_day_reset%.*} - $(date +%s) ))
    if [ "$remaining" -gt 0 ]; then
      days=$(( remaining / 86400 ))
      hrs=$(( (remaining % 86400) / 3600 ))
      seven_day_str="${seven_day_str}(→${days}d${hrs}hr)"
    fi
  fi
  right="$right  $(printf "%b%s%b" "$overlay" "$seven_day_str" "$reset")"
fi

# Print with spacing between left and right
if [ -n "$right" ]; then
  printf "%b  %b" "$left" "$right"
else
  printf "%b" "$left"
fi
