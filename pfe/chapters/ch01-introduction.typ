#import "@preview/droplet:0.3.1": dropcap

#set page(margin: (top: 60pt, bottom: 50pt, rest: 35pt))
#counter(page).update(1)

#heading(numbering: none)[General Introduction]
#set text(size: 13pt, style: "normal")
#set par(leading: 0.8em, spacing: 1.5em)

#v(20pt)

#dropcap(
  height: 2,
  gap: 9pt,
  overhang: 0pt,
  style: "italic",
)[
  #text()[
    #lorem(100)
  ]]

#pagebreak()
missing chapters
