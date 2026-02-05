#!/usr/bin/env bash
set -euo pipefail

shopt -s nullglob

count=0
for f in *.txt; do
  new="OLD_$f"
  if [[ "$f" == OLD_* ]]; then
    continue
  fi
  if [[ -e "$new" ]]; then
    echo "Skipping (target exists): $f -> $new"
    continue
  fi
  mv -- "$f" "$new"
  echo "Renamed: $f -> $new"
  ((count++))
done

echo "Done. Renamed $count file(s)."
