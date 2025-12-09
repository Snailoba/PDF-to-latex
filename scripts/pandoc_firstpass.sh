#!/usr/bin/env bash
# Optional first pass: try to convert extracted plain text to a rough LaTeX draft.
# Usage: ./pandoc_firstpass.sh extracted_text.txt draft.tex
set -e
IN="$1"
OUT="${2:-draft.tex}"
if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc not installed. Please install pandoc to use this script."
  exit 2
fi
# Pandoc from plain text is imperfect, but can help create an initial draft.
pandoc "$IN" -f plain -t latex -o "$OUT"
echo "Pandoc first-pass LaTeX created at $OUT"
