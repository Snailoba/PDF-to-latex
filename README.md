# DishDive Application Report (Ch. 1–5) — PDF → LaTeX project

This project is a clean, semantic LaTeX skeleton that I prepared for converting:
`DishDive Application Report Chapter 1 - 5.pdf` into an editable LaTeX project.

Summary of the PDF I inspected
- File: DishDive Application Report Chapter 1 - 5.pdf (from Snailoba/PDF-to-latex, branch main)
- Producer: Skia/PDF (Google Docs Renderer) — typically a digital (selectable) PDF.
- Expected extraction outcome: text should be extractable. Figures/images are embedded as XObjects. Equations and complex tables will need manual review and retyping.

What I prepared (in this draft)
- main.tex — top-level semantic document using newtxtext/newtxmath (a Times-like match compatible with pdflatex / Overleaf / MiKTeX).
- chapters/ch1.tex ... ch5.tex — per-chapter files with placeholders and instructions where to paste extracted text or images.
- scripts/extract_images.sh — uses pdfimages to extract images in original format.
- scripts/extract_text.sh — uses pdftotext to extract plain text with layout preserved.
- scripts/pandoc_firstpass.sh — optional first pass using pdftotext + pandoc to create initial LaTeX that you will refine.
- A `README.md` (this file) describing next steps and known limitations.

How to run the extraction locally (Linux/macOS, requires poppler-utils, pandoc, imagemagick optionally)
1. Clone the repo (or copy the PDF to a working folder).
2. Run:
   - `bash scripts/extract_images.sh "DishDive Application Report Chapter 1 - 5.pdf" images/`
     - This will create `images/img-<page>-<n>.<ext>` for embedded images.
   - `bash scripts/extract_text.sh "DishDive Application Report Chapter 1 - 5.pdf" extracted_text.txt`
     - This will create `extracted_text.txt` (layout-preserved textual output).
   - (Optional) `bash scripts/pandoc_firstpass.sh extracted_text.txt draft.tex` to get a Pandoc-first-pass LaTeX conversion you can use to help fill `chapters/*`.

Files that need manual attention (high priority)
- Equations / math: automatic extraction rarely yields valid LaTeX for complex math. Re-type important equations into the chapter files using amsmath.
- Tables: complex tables (merged cells, nested headers) will likely require manual reconstruction using tabular/booktabs/longtable.
- Figures: check each extracted image for resolution and caption placement. Replace with vector exports if available and preferred.
- Headers/footers/page-level layout: the skeleton is semantic (not a visual pixel-perfect replica). If you need exact visual parity with the PDF, that requires a different approach and more manual work.
- Fonts: the project uses newtxtext/newtxmath (Times-like) so it compiles with pdflatex on Overleaf/MiKTeX. If you want exact Times New Roman, switch to XeLaTeX and upload the TTF files.

Suggested next steps (what I recommend you run and then send me)
1. Run the extraction scripts from this project locally (they will populate `images/` and `extracted_text.txt`).
2. Open `images/` and the `extracted_text.txt`:
   - For each image you want placed inline, copy its filename into the appropriate chapter file and add \includegraphics lines.
   - For chapter content: split `extracted_text.txt` by chapter headings and paste into `chapters/ch*.tex`.
3. Recompile `main.tex` with pdflatex (or upload the whole project to Overleaf and compile with pdflatex).
4. After that first compile, send me the updated chapter files (or allow me to push them to your repo) and I will:
   - fix math (retype LaTeX math),
   - reconstruct complex tables,
   - clean up figure placement and captions,
   - run a second pass to improve spacing, references and cross-linking.

If you'd like me to push this skeleton into your GitHub repo on a new branch and open a PR with the skeleton files, say "please push the skeleton to the repo" and I will create a branch and open a PR with these files. (I won't push extracted images or the extracted text because I can't run the extraction here; you'd run the extraction locally and then either upload images to the repo or let me add them on a follow-up PR.)

Anything I should change now before you run the local extraction? (E.g., use XeLaTeX with fontspec + Times New Roman instead of newtx, prefer two-column layout, want me to push files to the repo directly.)
