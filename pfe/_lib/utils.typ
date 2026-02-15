// chapter  box with title
#let title_box_chapter(content) = {
  align(center, block(
    width: 100%,
    stroke: ( y: 1pt + black),
    inset: 80pt,
      text(size: 18pt, weight: "bold",  content)
  ))
}
// inline title ----chap---
#let inline_title(content) = {
  grid(
    columns: (1fr, auto, 1fr),
    gutter: 1em,
    align: horizon,
    line(length: 100%, stroke: 4pt),
    text(weight: "bold", content),
    line(length: 100%, stroke: 4pt),
  )
}
// chapter content table 
#let chapter_outline() = context {
  // Find the current chapter we are in
  let before = query(heading.where(level: 1).before(here()))
  if before.len() == 0 { return }
  let current_chap = before.last()
  
  // Find the next chapter to know where to stop
  let after = query(heading.where(level: 1).after(here()))
  
  // Get all level 2 headings after current chapter
  let all_h2 = query(heading.where(level: 2).after(current_chap.location()))
  
  // Filter to only those before next chapter (if exists)
  let chapter_h2 = if after.len() > 0 {
    let next_loc = after.first().location()
    all_h2.filter(h => {
      let h_page = counter(page).at(h.location()).first()
      let next_page = counter(page).at(next_loc).first()
      h_page < next_page
    })
  } else {
    all_h2
  }
  
  // Display them with numbering and page numbers
  for h in chapter_h2 {
    let page_num = counter(page).at(h.location()).first()
    let h_num = counter(heading).at(h.location())
    
    box(width: 100%)[
      #text()[#h_num.at(1)] // Section number (level 2)
      #box(width: 10pt)
      #link(h.location())[#h.body]
      #box(width: 1fr, repeat[.])
      #box(width: 2pt)
      #link(h.location())[#page_num]
    ]
    v(0.5em)
  }
}
// cover page box title 
#let title_box(content) = {
  align(center, block(
    width: 100%,
    stroke: ( y: 2pt + blue.darken(20%)),
    inset: 3pt,
    block(
      width: 100%,
      stroke: (paint: black, thickness: 0.5pt),
      inset: (y: 20pt),
      text(size: 18pt, weight: "bold", content)
    )
  ))
}