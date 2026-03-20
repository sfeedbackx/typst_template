// ======================================================
// CHAPTER TEMPLATE USAGE
// ------------------------------------------------------
// PURPOSE:
// This file creates a new chapter using the shared
// chapter template.
//
// HOW TO CUSTOMIZE:
// 1) Change chapter title:
//        #let chapter_title = [...]
//
// 2) Write chapter content inside:
//        #let chapter_body = [...]
//
// 3) The chapter page is generated automatically using
//    the function: #chapter_page(...)
//
// ------------------------------------------------------
// HOW TO CREATE ANOTHER CHAPTER:
//
// Copy this file or duplicate this block and change:
//
//   - chapter number ("1")
//   - chapter_title
//   - chapter_body
//
// Example:
//
//   #chapter_page("2", [New Title])[
//       Your content here
//   ]
//
// note that you need to add the new chapter in separate  file and included in main
// ======================================================

// Import chapter template (contains layout and styles)
#import "../_templates/chapter.typ":*


// ======================================================
// CUSTOMIZATION VARIABLES
// ======================================================

// Chapter title (change this for each chapter)
#let chapter_title = [Conception and Analysis]
#set par(spacing: 1em ,leading: 1em ,first-line-indent: 1em )

#set text(size: 14pt)
// to fix indent
#let fakepar = context { box(); v(-measure(block() + block()).height) }
#show heading.where(level: 2): it => {
  text(size: 18pt)[#it]
  fakepar
  
}

#show heading.where(level: 3): it => {
  it
  fakepar
}
// Chapter content
// Write your chapter sections here
#let chapter_body = [
  #text(size: 18pt , weight: "bold")[Introduction]
  
  #text()[
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
    the industry's standard dummy text ever since the 1500s, when an unknown printer took a
    galley of type and scrambled it to make a type specimen book. It has survived not only five
    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It
    was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
    passages, and more recently with desktop publishing software like Aldus PageMaker including
    versions of Lorem Ipsum.


  ]
  #v(1em)
  #heading(depth: 2 )[Title]
  #v(1em)
  #text()[
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
    the industry's standard dummy text ever since the 1500s, when an unknown printer took a
    galley of type and scrambled it to make a type specimen book. It has survived not only five
    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It
    was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum

    hard break line\
    soft break line

    passages, and more recently with desktop publishing software like Aldus PageMaker including
    versions of Lorem Ipsum.

]
  #v(5pt)
   #heading(depth: 3 )[Functional Requirements]

  #v(1em)
  #text()[
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
    the industry's standard dummy text ever since the 1500s, when an unknown printer took a
    galley of type and scrambled it to make a type specimen book. It has survived not only five
    centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It
    was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum
    passages, and more recently with desktop publishing software like Aldus PageMaker including
    versions of Lorem Ipsum.

#v(0.2em)
// list
    #list(
  indent: 1em,
  spacing: 0.5em,
  body-indent: 0.5em,
      marker: text(1.5em, baseline: -0.2em, [•]),
      [item1],
      [item 2],
    )
]
#figure(
table(
  columns: (auto, 1fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [*Requirement*],
  ),
     [FR01],
  [
      User can register and log in
  ],
),
    caption: [Functional Requirements]
) 

 
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



