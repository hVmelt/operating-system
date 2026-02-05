#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

FILE="$1"
LIMIT=1048576

if [[ ! -f "$FILE" ]]; then
  echo "Error: File does not exist: $FILE"
  exit 1
fi

SIZE=$(stat -c%s "$FILE")

echo "File: $FILE"
echo "Size: $SIZE bytes"

if (( SIZE > LIMIT )); then
  echo "Warning: File is too large"
else
  echo "File size is within limits."
fi
