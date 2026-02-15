//Global margin 
#set page(margin: (top: 8%,bottom:8%, rest: 5%))

//cover page ( to change the margin on the  cover page go to cover_page.typ)
#include "front/cover_page.typ"
#pagebreak()

#set heading(numbering: "1.1.1")
// begin section
#include "front/index.typ"



// switch to arabic number 
#set page(footer: context {
    stack(
      dir: ttb,   
      spacing: 10pt,  // <--- Adjust this value to bring the line closer or further
      line(length: 100%, stroke: 0.5pt),
      align(center, counter(page).display())
    )
  },
  numbering:"1")

#include "chapters/ch01-introduction.typ"
#parbreak()

#include "chapters/ch02-host-organizations-project-context.typ"


