// ======================================================
// COVER PAGE TEMPLATE (Typst)
// ------------------------------------------------------
// This file generates the cover page for the PFE report.
//
// HOW TO USE:
// - Edit only variables in "CONTENT VARIABLES".
// - Keep layout blocks (`grid`, `align`, `pad`) unless you want to redesign.
// - Logo paths must be valid relative paths.
// ======================================================

#import "../_lib/utils.typ": title_box
// Imports reusable framed title component for the project title section.

#set page(margin: (top: 20pt, rest: 30pt))
// Page margins used by all cover page blocks.


// ======================================================
// CONTENT VARIABLES
// ------------------------------------------------------
// Edit ONLY these values to customize the cover.
// Layout sections below consume these values automatically.
// ======================================================

#let main_title = [Report End of Studies Project] // Main headline shown near top
#let presented_for = [Presented in view of obtaining the title of :] // Intro sentence
#let degree = [ // Degree block (use "\" to force line breaks)
   National Engineering Degree in Computer Science \
   Software engineering and information systems
]

// University info
#let republic = [TUNISIAN REPUBLIC]
#let ministry = [MINISTRY OF HIGHER EDUCATION AND SCIENTIFIC RESEARCH]
#let university = [UNIVERSITY OF TUNIS EL MANAR]
#let faculty = [FACULTY OF SCIENCES OF TUNIS]
#let department = [Computer Science Department]

// Student identity
#let student_name = [SFAR AHMED KHALIL] // Student full name
#let student_label = [Realized By :] // Label before name

// Project identity
#let project_title = [ // Project title (supports multiline)
  Building Trust in Blockchain: A Formal \
  verification approach
]

// Jury members
#let jury_president = [Mrs. SFAR]
#let jury_reviewer = [Mrs. SFAR]
#let jury_supervisor = [Mrs. SFAR]
#let jury_pedagogic_advisor = [Mr. SFAR]

// Host organization
#let host_org = [RISQUE]
#let host_org_name = [Laboratoire d'Informatique SFAR]

// Student class information
#let student_class = [GLSI3 - N° 554545454545] // Class and identifier
#let academic_year = [Academic Year 2024 - 2025]

// Logo file paths (relative to this file)
#let logo_fst = "../assets/FSTLOGO.png"
#let logo_utm = "../assets/Logo_UTM.png"
#let logo_host_org = "../assets/FSTLOGO.png"



// ======================================================
// HEADER SECTION
// Layout: [Left Logo] [Centered University Text] [Right Logo]
// ======================================================
#grid(
  // Column width distribution.
  columns: (1fr, 4fr ,1fr),
  // Space between columns.
  column-gutter: 5pt,
  align: ( horizon,center, horizon ),
  // Left logo cell.
 [
      #image(logo_fst, width: 100pt ),
  ],
  // Centered university/faculty text block.
  [
    #set text(size: 14pt, weight: "bold")
    #republic \ 
    #ministry \
    #university
    
  #align(horizon)[
  #text(size: 9.5pt, weight: "bold")[#faculty] \
  #text(size: 12pt, weight: "regular")[#department]
]
  ],
  // Right logo cell.
  [#image(logo_utm , width: 90pt)]
  
)

#v(3em) 
// Vertical spacing between header and title section.


// ======================================================
// MAIN TITLE + STUDENT SECTION
// ======================================================
#align(center)[
  #text(size: 20pt, weight: "bold")[#main_title]
  
  // This stack ensures the lines stay tight together and centered
  #stack(
    spacing: 1em,
    text(size: 13pt,)[#presented_for],
    text(size: 14pt, weight: "regular")[
     #degree
    ]
  )
  #v(0.2em)
    #text(size: 18pt,)[#student_label] 
    
    #text(size: 19pt, weight: "bold")[#student_name]
  
]


#v(1em)

// ======================================================
// PROJECT TITLE BOX
// Uses imported `title_box` component for consistent framing.
// ======================================================
#title_box([
#project_title
])
#v(1em)


// ======================================================
// JURY MEMBERS SECTION
// Left column = role labels, right column = configured names.
// ======================================================
#grid(
  columns: (20pt ,0.5fr,1fr),
  align: (left ),
  [],
  [#text(size: 12pt )[Jury president :

  Reviewer :

  Supervised by :

  Pedagogic advisor :
]],
  [#text(size: 12pt, weight: "bold")[
  #jury_president

  #jury_reviewer

  #jury_supervisor

  #jury_pedagogic_advisor
]]
)

#v(1.5em)

// ======================================================
// HOST ORGANIZATION SECTION
// ======================================================
#align(center)[
    #text(size: 16pt, weight: "regular")[Host organization: #host_org \
    #host_org_name
  
  ]
]
#v(1em)

// Host organization logo placement.
#pad(left :100pt)[
  #image(logo_host_org , width: 100pt)
]

#v(1.25em)

// ======================================================
// STUDENT CLASS BOX
// ======================================================
#align(center, block(
      width: 60%,
      stroke: (paint: black, thickness: 0.5pt),
      inset: (y: 8pt),
      text(size: 16pt, [#student_class])
    ))

#v(1.5em)

// ======================================================
// ACADEMIC YEAR FOOTER
// ======================================================
#align(center)[
  #text()[#academic_year]
]

// Force next page after cover page.
#pagebreak()
