#!/usr/bin/env bash
set -euo pipefail

echo "Top 5 processes by memory usage (RSS):"
printf "%-25s %-8s %12s\n" "NAME" "PID" "RSS(KB)"
ps -eo comm,pid,rss --sort=-rss | head -n 6 | tail -n 5 | awk '{
  printf "%-25s %-8s %12s\n", $1, $2, $3
}'
