#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 path/to/slides.md" >&2
  exit 1
fi

INPUT_FILE="$1"
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Input file not found: $INPUT_FILE" >&2
  exit 1
fi

BASE_NAME="${INPUT_FILE%.md}"

npx --yes @marp-team/marp-cli "$INPUT_FILE" --html --allow-local-files -o "${BASE_NAME}.html"
npx --yes @marp-team/marp-cli "$INPUT_FILE" --pdf  --allow-local-files -o "${BASE_NAME}.pdf"

echo "Generated:"
echo "  ${BASE_NAME}.html"
echo "  ${BASE_NAME}.pdf"
