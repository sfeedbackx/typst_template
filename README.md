# PFE Report Template in Typst

This template helps you produce a structured engineering report with:

- A customizable cover page
- Reusable chapter layout
- Styled headings, tables, figures, and lists
- Utility helpers for references and callouts

## 1) Prerequisites

Choose one method:

- Docker (no local Typst install needed)
- Typst CLI installed locally

## 2) Run with Docker

Build once:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  compile /work/main.typ /work/main.pdf
```

Live watch:

```bash
docker run --rm \
  -v "$(pwd):/work" \
  ghcr.io/typst/typst:0.14.2 \
  watch /work/main.typ /work/main.pdf
```

## 3) Run with Local Typst

```bash
typst watch main.typ main.pdf
```

## 4) Where to Edit

- Cover page values: `front/cover_page.typ`
- Chapter content: `chapters/ch02-host-organizations-project-context.typ`, `chapters/ch03-Conception-Analysis.typ`
- Chapter template behavior: `_templates/chapter.typ`
- Helper functions: `_lib/utils.typ`
- Spacing scale: `constant.typ`

## 5) Add a New Chapter

1. Duplicate a chapter file from `chapters/`.
2. Update `chapter_title` and `chapter_body`.
3. Set chapter number in `#chapter_page("N", chapter_title)[...]`.
4. Include the file in `main.typ`.

## 6) Reference Helpers

Available helpers from `_lib/utils.typ`:

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
- Broken image/logo: verify relative file paths.
- Chapter not shown: ensure it is included in `main.typ`.

## 8) Contribution

Contributions are welcome.

If you want to contribute:

1. Create a feature branch.
2. Keep changes focused and documented.
3. Open a pull request with a short description of what and why.
