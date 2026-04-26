// ======================================================
// CHAPTER EXAMPLE (Template Usage)
// ------------------------------------------------------
// This file demonstrates how to build a chapter with:
// - shared layout from `chapter_page(...)`
// - heading style overrides for levels 2-5
// - spacing tokens from `constant.typ`
// - utility helpers (`definition`, `note`, `figureref`, `titleref`)
//
// To create another chapter, copy this file and change:
// - chapter number in `#chapter_page("N", ...)`
// - `chapter_title`
// - `chapter_body`
//
// Then import the new file in `main.typ`.
// ======================================================

// Import chapter template (contains layout and styles)
#import "../_templates/chapter.typ": *
#import "../constant.typ": *
#import "../_lib/utils.typ": definition, figureref, note, titleref

#let ch03_abr = (
  "NFRs": "Non-functional requirements",
)





// ======================================================
// CUSTOMIZATION VARIABLES
// ======================================================

#let chapter_title = [Conception and Analysis]

// Chapter title (change this for each chapter)
//#set par(spacing: 1em, leading: 1em, first-line-indent: 1em)
//#set text(size: 14pt)
//table prop


#let fakepar = context {
  // Keeps heading spacing tight after custom `show heading` styles.
  box()
  v(-measure(block() + block()).height)
}
#show heading.where(level: 2): it => {
  text(size: 14pt, weight: "bold")[#it]
  fakepar
}
#show heading.where(level: 3): it => {
  text(size: 12pt, weight: "bold", style: "italic")[#it]
  fakepar
}

#show heading.where(level: 4): it => {
  text(size: 12pt, style: "italic")[#it]
  fakepar
}

#show heading.where(level: 5): it => {
  text(size: 11pt, style: "italic")[#it]
  fakepar
}


// Chapter content
// Write your chapter sections here
#let chapter_body = [
  #text(size: 14pt, weight: "bold")[Introduction]
  #lvl_4_ab_lvl_2_dwn
  #fakepar
  #text()[
    #lorem(100)
  ]
  #lvl_3_ab
  #heading(depth: 3)[List]
  #lvl_3_dwn_lvl_5_ab
  #text()[
    #lorem(20)
    #vs-xxs
    #list(
      [#lorem(5)],
      [#lorem(7)],
    )
  ]
  #lvl_4_ab_lvl_2_dwn
  #heading(depth: 4)[Table]<table_ref>
  #lvl_4_dwn
  #text()[
    #lorem(20)
    #vs-xxs
    #figure(
      table(
        columns: (auto, auto, auto, auto),
        align: center,
        table.header(
          [#align(center + horizon)[*col1*]],
          [#align(center + horizon)[*col2*]],
          [#align(center + horizon)[*col3*]],
          [#align(center + horizon)[*col4*]],
        ),
        [val1],
        [val2],
        [val3],
        [
          val4
        ],

        [val1],
        [val2],
        [val3],
        [
          val4
        ],
      ),
      caption: [Table example],
    )

  ]
  #heading(depth: 2)[lvl2_title]<sections>
  #lvl_4_ab_lvl_2_dwn
  #heading(depth: 4)[lvl4_title]
  #lvl_4_dwn
  #lorem(40)
  #definition()[
    #text(hyphenate: false)[
      #lorem(125)
    ]
  ]
  #note(
    lorem(20),
  )

  #figure(
    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 1em,
      align: center,
      image("../assets/coderabbit1.png", width: 100%),
      image("../assets/coderabbit2.png", width: 100%),
      image("../assets/coderabbit3.png", width: 100%),

      text(style: "italic")[(a) Inline code feedback],
      text(style: "italic")[(b) Sequence diagram generation],
      text(style: "italic")[(c) Pull request walkthrough],
    ),
    caption: [example multiple picture],
    kind: image,
  )<image_ref>
  // Reference examples (implemented in content output):
  // - Figure reference helper: #figureref(<image_ref>)
  // - Section reference helper: #titleref(<sections>)
  #text()[
    Example references in running text: see #figureref(<image_ref>) and #titleref(<sections>).
  ]
]










// ======================================================
// DOCUMENT SETTINGS
// ======================================================
// Set document metadata (title used in PDF properties)
#set document(title: chapter_title)


// ======================================================
// CHAPTER GENERATION
// ------------------------------------------------------
// Parameters:
//   "1"             -> Chapter number
//   chapter_title   -> Chapter title
//   [ ... ]         -> Chapter content
// ======================================================
#chapter_page("2", chapter_title)[
  #chapter_body
]

