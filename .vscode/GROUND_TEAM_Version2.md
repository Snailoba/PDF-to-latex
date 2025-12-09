# Ground Team checklist — Convert PDF → Semantic LaTeX (quick steps)

This is a short checklist for working in VS Code on the `pdf2latex-skeleton` branch.

Prereqs (local)
- Install poppler-utils (pdftotext, pdfimages) and pandoc (optional).
  - macOS: `brew install poppler pandoc`
  - Ubuntu: `sudo apt install poppler-utils pandoc`
- Install a LaTeX toolchain (TeX Live or MiKTeX) with latexmk preferred.
- In VS Code install recommended extensions (Run: View → Extensions → "Install Workspace Recommended Extensions").

Quick workflow
1. Open the repository in VS Code and switch to branch `pdf2latex-skeleton`.
2. Make scripts executable (Run Task → Make scripts executable) or run in terminal:
   - `chmod +x scripts/*.sh`
3. Extract images (Run Task → Extract images).
   - Output goes to `images/` as `img-<page>-<n>.<ext>`.
4. Extract text (Run Task → Extract text (layout)).
   - Output file: `extracted_text.txt`.
5. (Optional) Run Pandoc first-pass to get a rough LaTeX: Run Task → Pandoc first pass.
   - Output: `draft.tex` — a rough conversion to help splitting into chapters.
6. Open `extracted_text.txt`, locate chapter headings and paste each chapter’s content into the corresponding file under `chapters/` (ch1..ch5).
   - Keep the semantic structure: \section, \subsection, itemize/enumerate, etc.
7. For math/equations:
   - If the extractor produced images of equations, those will be in `images/`. Prefer retyping important equations in LaTeX (amsmath).
8. Replace placeholder figures in chapter files with \includegraphics entries pointing to `images/` files and add captions.
9. Compile locally: Run Task → LaTeX: build (uses latexmk when available).
   - Fix errors printed in the terminal; re-run build until clean.
10. Push changes:
    - Add and commit: `git add . && git commit -m "Populate chapters from extracted text; add images"`.
    - Push to branch: `git push origin pdf2latex-skeleton`.
11. Open a Pull Request on GitHub (or ask me and I can open it for you).

Naming and small rules
- Keep image filenames as produced (img-<page>-<n>.*). If you replace an image, keep a meaningful alternative name and update the includegraphics path.
- Put new images into `images/` and add them to git.
- For major edits to equations or tables, include a short note in the PR describing what you changed and why.

Troubleshooting
- If pdftotext output is badly formatted in places (tables, equations) — don’t try to force it; retype those parts manually for a clean semantic result.
- If latexmk is not installed, the "LaTeX: build (latexmk)" task falls back to running pdflatex twice.
- If Overleaf is preferred, upload the whole project (zip) and compile there with pdflatex. If you need exact Times New Roman on Overleaf, switch to XeLaTeX and upload the TTFs.

If anything is unclear, paste the extracted_text.txt or a sample of a problematic page into a message and I’ll show exactly how to convert it into semantic LaTeX.