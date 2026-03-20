#set heading(numbering: "1.1.1")
//this to make space between the <Table of content>
#show outline: it => {
  show heading: set block(below: 2em) 
  it
}
//this for big title  1 , 2 space in content table 
#show outline.entry.where(
  level: 1
): set block(above: 1em , below: 1em)
// --- Table of Contents ---
#outline(indent: 1.5em, title: [Table of contents])

#pagebreak()
// --- List of Figures ---
#outline(
  title: [List of Figures],
  target: figure.where(kind: image).or(figure.where(kind: table)),
)
#pagebreak()
// --- List of Abbreviations ---
#heading(level: 1, outlined: false , numbering: none)[List of Abbreviations]
#v(3em) // vertical space 
/ PoS: Proof of Stake
/ DAO: Decentralized Autonomous Organization

#pagebreak()
