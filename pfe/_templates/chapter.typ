#import "../_lib/utils.typ": chapter_outline, inline_title, title_box_chapter

// Main reusable chapter template.
// Parameters:
// - chapter_num: chapter number shown in header/opening page
// - chapter_title: chapter title displayed in chapter title box
// - body: chapter content inserted after template styling is applied
#let chapter_page(chapter_num, chapter_title, body) = {
  // Chapter opening page: no footer or page numbering.
  set page(footer: none, numbering: none)

  show heading.where(level: 1): it => {
    set align(center)
    text(size: 24pt, weight: "bold")[#it.body]
  }

  inline_title[Chapter #chapter_num]

  title_box_chapter(heading(context {
    let h = heading()[#chapter_title]
    h.body
  }))

  v(80pt)
  chapter_outline()
  // The content that follows uses the default chapter body style.

  set page(
    paper: "a4",
    footer: context {
      stack(
        dir: ttb,
        spacing: 5pt, // footer line-to-page-number spacing
        line(length: 100%, stroke: 0.5pt),
        align(center, counter(page).display()),
      )
    },
    numbering: "1",
    margin: (top: 2.5cm, left: 3cm, right: 2cm, bottom: 2.5em),
    header: context {
      // Build running header title from current chapter and document title.
      let title = counter(heading).display() // Or use document.title below
      let doc_title = if document.title != none {
        "Chapter " + chapter_num + "." + h(5pt) + document.title
      } else {
        "No Title Set"
      }

      align(left + horizon)[
        #block(
          width: 100%,
          stroke: (bottom: 0.7pt),
          inset: (bottom: 5pt),
          below: 0pt,
          text(style: "italic", size: 12pt, doc_title),
        )
      ]
    },
  )
  set text(
    size: 12pt,
    lang: "en",
    hyphenate: true,
  )
  set par(
    leading: 0.75em, // space between lines (~1.5 line spacing)
    first-line-indent: 1cm,
    spacing: 1.2em, // space between paragraphs
  )
  show par: set text(hyphenate: false)
  //      marker: text(1.5em, baseline: -0.2em, [•]),
  set list(
    indent: 1.8em,
    spacing: 1em,
    body-indent: 0.5em,
      marker: ([•], [–], [◦]), // bullet style sequence by nesting level
  )

  // Table defaults: styled header row + zebra striping.
  show table.cell.where(y: 0): set text(weight: "bold", fill: white)
  set table(
    stroke: 0.5pt + black,
    inset: 8pt,
    align: left,
    fill: (col, row) => if row == 0 { rgb("#1a1a6e") } // header row gray
    else if calc.odd(row) { luma(245) } // zebra striping
    else { white },
  )
  show figure.where(kind: table): it => {
    // Table figure captions are rendered in italic style.
    set block(breakable: true)
    set text(size: 10pt, style: "italic")
    it
  }

  set figure(
    gap: 0.7em,
  )

  show figure.caption: it => {
    set text(size: 10pt, style: "italic")
    set align(center)
    it
  }

  body
}
