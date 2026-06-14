// ======================================================
// CHAPTER 5 — Project Realization (Template Demo)
// ------------------------------------------------------
// Replace the content below with your own implementation
// details, APIs, integration steps, and deployment info.
// ======================================================

#import "../_templates/chapter.typ": *
#import "../constant.typ": *
#import "../_lib/utils.typ": definition, figureref, note, tableref, titleref

#let chapter_title = [Project Realization]

#let fakepar = context {
  box()
  v(-measure(block() + block()).height)
}

#show heading.where(level: 2): it => {
  text(size: 14pt, weight: "bold")[#it]
  fakepar
}
#show heading.where(level: 3): it => {
  text(size: 12pt, weight: "bold", style: "italic")[#it]
  fakepar
}
#show heading.where(level: 4): it => {
  text(size: 12pt, style: "italic")[#it]
  fakepar
}

#let chapter_body = [
  #text(size: 14pt, weight: "bold")[Introduction]
  #lvl_4_ab_lvl_2_dwn
  #fakepar
  #text()[
    This chapter details the practical implementation of the project. It covers the
    technology stack, core features, API design, integration with external services,
    and the deployment pipeline.
  ]

  #lvl_2_ab
  #heading(depth: 2)[Technology Stack]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    Describe the technologies used in your project, including the programming language,
    framework, database, cloud services, and tools. Justify each choice based on project
    requirements.

    #definition()[
      *A framework* provides a structured foundation for development, offering pre-built
      components and enforcing organization patterns.
    ]
  ]

  #lvl_2_ab
  #heading(depth: 2)[Core Features Implementation]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    Detail the implementation of the main features of your application. Include code
    snippets, architecture diagrams, and API endpoint descriptions.

    #heading(depth: 3)[Feature 1: Authentication and Authorization]
    Describe how authentication and authorization are implemented. Include the security
    measures taken to protect user data.

    #heading(depth: 3)[Feature 2: Core Business Logic]
    Describe the main business logic of your application, including workflows, data
    processing, and key algorithms.

    #heading(depth: 3)[Feature 3: Real-Time Communication]
    If applicable, describe how real-time features are implemented (WebSockets,
    push notifications, etc.).
  ]

  #lvl_2_ab
  #heading(depth: 2)[Testing and Quality Assurance]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    Describe the testing strategy: unit tests, integration tests, end-to-end tests.
    Include coverage metrics and CI/CD pipeline configuration.

    #note()[
      Aim for comprehensive test coverage of critical paths. Automated testing
      in CI/CD pipelines helps catch regressions early.
    ]
  ]

  #lvl_2_ab
  #heading(depth: 2)[Deployment and DevOps]
  #lvl_4_ab_lvl_2_dwn
  #text()[
    Describe the deployment architecture, infrastructure as code, containerization,
    and cloud services used to host the application.

    #list(
      [Environment setup and configuration management],
      [Containerization with Docker],
      [CI/CD pipeline configuration],
      [Cloud infrastructure and scaling],
    )
  ]
]

#set document(title: chapter_title)

#chapter_page("5", chapter_title)[
  #chapter_body
]
