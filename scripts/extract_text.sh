#!/usr/bin/env bash
# Usage: ./extract_text.sh "DishDive Application Report Chapter 1 - 5.pdf" extracted_text.txt
set -e
PDF="$1"
OUT="${2:-extracted_text.txt}"
# Requires poppler-utils (pdftotext)
pdftotext -layout "$PDF" "$OUT"
echo "Text extracted to $OUT"
