
#let titleref(label) = context {
  // Creates a clickable section reference like "Section(2.3)" from a heading label.
  let target = query(label).first()
  let num = counter(heading).at(target.location())
  link(label)[#text(fill: blue, [Section(#num.map(str).join("."))])]
}

#let figureref(label) = context {
  // Creates a clickable figure reference like "Figure 1.2" from an image label.
  let target = query(label).first()
  let num = counter(figure.where(kind: image)).at(target.location())
  link(label)[#text(fill: blue, [Figure #num.map(str).join(".")])]
}

#let note(body) = block(
  // Reusable highlighted note callout.
  width: 100%,
  inset: (left: 12pt, top: 6pt, bottom: 6pt, right: 8pt),
  stroke: (left: 3pt + blue),
  fill: blue.lighten(90%),
  radius: (right: 4pt),
)[#text(weight: "bold", fill: blue)[Note: ]#body]

#let definition(body) = block(
  // Reusable highlighted definition callout.
  width: 100%,
  inset: (left: 12pt, top: 6pt, bottom: 6pt, right: 8pt),
  stroke: (left: 3pt + green),
  fill: green.lighten(90%),
  radius: (right: 4pt),
)[#text(weight: "bold", fill: green, hyphenate: false)[Definition: ]#body]

// Draws the framed chapter-title block used on chapter opening pages.
#let title_box_chapter(content) = {
  align(center, block(
    width: 100%,
    stroke: (y: 1pt + black),
    inset: 80pt,
    text(size: 18pt, weight: "bold", content),
  ))
}
// Renders centered inline title with horizontal lines on both sides.
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
// Builds a mini chapter outline containing level-2 headings and page numbers.
// It only lists headings that belong to the current chapter.
#let chapter_outline() = context {
  // Find the current level-1 heading (chapter).
  let before = query(heading.where(level: 1).before(here()))
  if before.len() == 0 { return }
  let current_chap = before.last()

  // Find the next chapter so we know where the current one ends.
  let after = query(heading.where(level: 1).after(here()))

  // Collect level-2 headings after current chapter start.
  let all_h2 = query(heading.where(level: 2).after(current_chap.location()))

  // Keep only level-2 headings before next chapter (if any).
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

  // Render section number, section title link, dot leaders, and page link.
  for h in chapter_h2 {
    let page_num = counter(page).at(h.location()).first()
    let h_num = counter(heading).at(h.location())

    box(width: 100%)[
      #text()[#h_num.at(1)] // level-2 section number
      #box(width: 10pt)
      #link(h.location())[#h.body]
      #box(width: 1fr, repeat[.])
      #box(width: 2pt)
      #link(h.location())[#page_num]
    ]
    v(0.5em)
  }
}
// Draws the framed title block used in the cover page.
#let title_box(content) = {
  align(center, block(
    width: 100%,
    stroke: (y: 2pt + blue.darken(20%)),
    inset: 3pt,
    block(
      width: 100%,
      stroke: (paint: black, thickness: 0.5pt),
      inset: (y: 20pt),
      text(size: 18pt, weight: "bold", content),
    ),
  ))
}
