
// this contain all front content 
// the cover page in main
#set page(footer: context {
    stack(
      dir: ttb,      // Top-to-bottom
      spacing: 8pt,  // <--- Adjust this value to bring the line closer or further
      line(length: 100%, stroke: 0.5pt),
      align(right, counter(page).display())
    )
  },
  numbering:"i")
  #counter(page).update(1)
  #include "signature.typ"
  #include "dedication.typ"
  #include "acknowledgment.typ"
  #include "navigation.typ"
