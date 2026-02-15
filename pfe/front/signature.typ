#set page(footer: none)
// ======================================================
// AUTHORIZATION BLOCKS SECTION
// ------------------------------------------------------
// PURPOSE:
// Displays two authorization boxes for professional tutors.
//
// HOW TO CUSTOMIZE:
// 1) Change the authorization phrase using:
//        #let authorization_text = [...]
//
// 2) Change tutor names using:
//        #let tutor_1 = [...]
//        #let tutor_2 = [...]
//
// NOTE:
// - Do NOT modify the grid or block layout unless you
//   understand Typst layout behavior.
// ======================================================



// ======================================================
// 
//  CUSTOMIZATION VARIABLES
// 
// ======================================================

// Authorization phrase (main text inside both boxes)
// You can change language or wording freely.
#let authorization_text = [
J’autorise l’étudiant à faire le dépôt de son rapport de stage en vue d’une soutenance.
Encadrant professionnel
]

// Tutor names (edit here only)
#let tutor_1 = [M. SFAR]
#let tutor_2 = [M. SFARS]


#grid(
  rows: (1fr,1fr),
  [#block(
      width: 100%,
      stroke: (paint: black, thickness: 2pt),// Border style
      height: 70%,// Block height
      inset: (y:70pt , x:20pt),// Inner spacing
      align(center,text(size: 16pt, weight: "regular", [#authorization_text, *#tutor_1*\ 
      // Signature spacing

          #h(70%)Signature ])
        )
    
    )],
    [#block(
      width: 100%,
      stroke: (paint: black, thickness: 2pt),
      height: 70%,
      inset: (y:70pt , x:20pt),
         align(center,text(size: 16pt, weight: "regular", [#authorization_text, *#tutor_2*\
         // Signature spacing
         
          #h(70%)Signature ])
        )
    )]
)
