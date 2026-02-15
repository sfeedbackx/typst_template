#import "../_lib/utils.typ": inline_title ,title_box_chapter , chapter_outline

// chapter template 
#let chapter_page(chapter_num, chapter_title ,body) = {
  // cover page for chapter 
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
  // the content inside the chapter 
  set page(
    footer: context {
    stack(
      dir: ttb,   
      spacing: 10pt,  // <--- Adjust this value to bring the line closer or further
      line(length: 100%, stroke: 0.5pt),
      align(center, counter(page).display())
    )
  },
  numbering:"1",
  margin: (top: 8%,bottom:8%, rest: 5%),
  header: context {
    // 1. Retrieve the title from document metadata
    let title = counter(heading).display() // Or use document.title below
    let doc_title = if document.title != none { document.title } else { "No Title Set" }

    align(left + horizon)[
      #block(
        width: 100%,
        stroke: (bottom: 0.7pt),
        inset: (bottom: 10pt),
        text(style: "italic", size: 12pt, doc_title)
      )
    ]
  }
)
body
}
