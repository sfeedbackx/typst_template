// ======================================================
// CHAPTER EXAMPLE (Template Usage)
// ------------------------------------------------------
// This file demonstrates how to build chapter content with
// the shared `chapter_page(...)` template and spacing tokens.
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

// ======================================================
// CUSTOMIZATION VARIABLES
// ======================================================

// Chapter title (change this for each chapter)
#let chapter_title = [Host Organizations and Project Context]
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
// Chapter content
// Write your chapter sections here
#let chapter_body = [
  #text(size: 14pt, weight: "bold")[Introduction]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    #lorem(100)
  ]
  #lvl_2_ab
  #heading(depth: 2)[lvl2_title]
  #lvl_4_ab_lvl_2_dwn
  #heading(depth: 3)[lvl3_title]
  #lvl_3_dwn_lvl_5_ab
  #text()[
    #lorem(100)
  ]
  #lvl_2_ab
  #heading(depth: 2)[lvl2_title]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    #lorem(100)
  ]
  //#pagebreak()
  #text()[
    #lorem(20)
    #vs-s
    #list(
      [#lorem(5)],
      [#lorem(5)],
    )
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
#chapter_page("1", chapter_title)[
  #chapter_body
]

