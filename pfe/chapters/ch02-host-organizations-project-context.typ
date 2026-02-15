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
#let chapter_title = [Host Organizations and Project Context]

// Chapter content
// Write your chapter sections here
#let chapter_body = [
 #heading(depth: 2)[chapter title]
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
#chapter_page("1", chapter_title)[
 #chapter_body
]


