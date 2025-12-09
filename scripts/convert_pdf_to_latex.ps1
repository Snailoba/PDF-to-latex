param(
    [string]$PdfPath = "DishDive Application Report Chapter 1 - 5.pdf",
    [string]$OutDir = "latex_output"
)

function Check-Command($name) {
    try { Get-Command $name -ErrorAction Stop | Out-Null; return $true } catch { return $false }
}

Write-Host "Checking prerequisites..."
$hasPdftotext = Check-Command pdftotext
$hasPandoc = Check-Command pandoc

if (-not $hasPdftotext) {
    Write-Host "pdftotext (poppler) not found. Install via Chocolatey: `choco install poppler -y` or download from https://poppler.freedesktop.org/"
}
if (-not $hasPandoc) {
    Write-Host "pandoc not found. Install via Chocolatey: `choco install pandoc -y` or from https://pandoc.org/installing.html"
}

if (-not $hasPdftotext -or -not $hasPandoc) {
    Write-Host "Please install the missing prerequisites, then re-run this script." -ForegroundColor Yellow
    exit 2
}

if (-not (Test-Path $PdfPath)) {
    Write-Host "PDF not found at path: $PdfPath" -ForegroundColor Red
    exit 3
}

Write-Host "Creating output directory $OutDir..."
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$textOut = Join-Path $OutDir "extracted_text.txt"
Write-Host "Running pdftotext -layout to extract text to $textOut"
pdftotext -layout "$PdfPath" "$textOut"

$mainTex = Join-Path $OutDir "main.tex"
Write-Host "Converting extracted text to LaTeX with pandoc -> $mainTex"
pandoc -f plain -t latex -s "$textOut" -o "$mainTex"

Write-Host "Conversion finished. Files in: $OutDir"
Write-Host "Note: The LaTeX output is a best-effort draft. Manual cleanup likely required (figures, sectioning, equations)."
