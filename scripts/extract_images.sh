#!/usr/bin/env bash
# Usage: ./extract_images.sh "DishDive Application Report Chapter 1 - 5.pdf" images/
set -e
PDF="$1"
OUTDIR="${2:-images}"
mkdir -p "$OUTDIR"
# Requires poppler-utils (pdfimages)
# -all extracts all image formats, naming img-<page>-<n>.<ext>
pdfimages -all "$PDF" "$OUTDIR/img"
echo "Images extracted to $OUTDIR/ (files named img-<page>-<n>.<ext>)"
