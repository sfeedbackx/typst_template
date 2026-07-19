# Typst Templates

This repository contains Typst templates:

- **PFE Report** (`pfe/`) — structured engineering report with cover page, chapters, and utility helpers.
- **CV** (`cv/`) — a clean, sectioned curriculum vitae template.
- **Motivation Letter** (`motivation-letter/`) — a formal motivation letter template for applications.

## 1) Prerequisites

Choose one method:

- Docker (no local Typst install needed)
- Typst CLI installed locally

## 2) Run with Docker

### PFE Report

Build once:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  compile /work/pfe/main.typ /work/pfe/report.pdf
```

Live watch:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  watch /work/pfe/main.typ /work/pfe/report.pdf
```

### CV

Build once:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  compile /work/cv/main.typ /work/cv/cv.pdf
```

Live watch:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  watch /work/cv/main.typ /work/cv/cv.pdf
```

### Motivation Letter

Build once:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  compile /work/motivation-letter/main.typ /work/motivation-letter/motivation-letter.pdf
```

Live watch:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  watch /work/motivation-letter/main.typ /work/motivation-letter/motivation-letter.pdf
```

## 3) Run with Local Typst

```bash
# PFE
typst watch pfe/main.typ pfe/report.pdf

# CV
typst watch cv/main.typ cv/cv.pdf

# Motivation Letter
typst watch motivation-letter/main.typ motivation-letter/motivation-letter.pdf
```

## 4) Where to Edit

### PFE Report

- Cover page values: `pfe/front/cover_page.typ`
- Chapter content: `pfe/chapters/ch02-host-organizations-project-context.typ`, `pfe/chapters/ch03-Conception-Analysis.typ`
- Chapter template behavior: `pfe/_templates/chapter.typ`
- Helper functions: `pfe/_lib/utils.typ`
- Spacing scale: `pfe/constant.typ`

### CV

- CV content: `cv/main.typ` (edit sections directly: Header, Experience, Projects, Skills, etc.)

### Motivation Letter

- Letter content: `motivation-letter/main.typ` (edit sections directly: Subject, Salutation, Body paragraphs, Sign-off)

## 5) Add a New Chapter

1. Duplicate a chapter file from `pfe/chapters/`.
2. Update `chapter_title` and `chapter_body`.
3. Set chapter number in `#chapter_page("N", chapter_title)[...]`.
4. Include the file in `pfe/main.typ`.

## 6) Reference Helpers

Available helpers from `pfe/_lib/utils.typ`:

- `#figureref(<label>)`: clickable figure reference
- `#titleref(<label>)`: clickable section reference
- `#note[...]`: note callout
- `#definition[...]`: definition callout

Example:

```typst
#heading(depth: 2)[System Overview]<sec_overview>

#figure(
  image("../assets/example.png", width: 80%),
  caption: [Architecture],
)<fig_arch>

As shown in #figureref(<fig_arch>), the flow is introduced in #titleref(<sec_overview>).
```

## 7) Troubleshooting

- `typst: command not found`: use Docker commands above.
- Broken image/logo: verify relative file paths (assets are in `cv/assets/` for CV, `pfe/assets/` for PFE).
- Chapter not shown: ensure it is included in `pfe/main.typ`.
- CV not building: run from the repository root, not from `cv/`.
- Motivation letter not building: run from the repository root, not from `motivation-letter/`.

## 8) Contribution

Contributions are welcome.

If you want to contribute:

1. Create a feature branch.
2. Keep changes focused and documented.
3. Open a pull request with a short description of what and why.
