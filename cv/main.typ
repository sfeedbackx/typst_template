// CV Template for Typst
// This is a template file — edit the content below to build your own CV.
// Sections: Header, Objective, Experience, Projects, Skills, Leadership, Certifications, Education, Additional Info, References.

#set page(paper: "a4", margin: (
  left: 1.4cm,
  right: 1.2cm,
  top: 0.8cm,
  bottom: 1cm,
))
#set text(size: 10.5pt)
#set par(justify: false)
#set list(spacing: 3mm)

#let darkblue = rgb("#00008B")

// ---------- Helper functions ----------
// sectionTitle(title)       — renders a styled section heading
// subheading(title, loc, subtitle, date) — two-line entry (job/education)
// project(title, tools, date, link_icon) — project or role entry
// por(label, date)          — single-line entry (certifications)


#let sectionTitle(title) = {
  v(-1mm)
  text(size: 13pt, weight: "bold")[#smallcaps[#title]]
  v(-3mm)
  line(length: 100%, stroke: 0.8pt)
  v(-1mm)
}

#let subheading(title, location, subtitle, date) = {
  grid(
    columns: (1fr, auto),
    [*#title*], [#emph(text(size: 9pt)[#date])],
  )
  grid(
    columns: (1fr, auto),
    align: (horizon, center),
    [#emph(text(size: 9pt)[#v(-2mm)#subtitle])],
    [#text(size: 9pt)[#v(-2mm)#location]],
  )
}

#let project(title, tools, date, link_icon) = {
  //v(-1mm)
  grid(
    columns: (1fr, auto),
    align: horizon,
    [*#title*], [#emph(text(size: 9pt)[#date])],
  )
  v(-2mm)
  grid(
    columns: (1fr, auto),
    align: horizon,
    [#emph(text(size: 9pt)[#tools])], [#text(size: 9pt)[#v(-1.5mm)#link_icon]],
  )
  v(-1.5mm)
}

#let por(label, date) = {
  show link: set text(rgb("#00008b"))
  grid(
    columns: (1fr, auto),
    [#label], [#emph(text(size: 9pt)[#date])],
  )
}

// ---------- Header ----------

#align(center)[
  #text(size: 24pt, weight: "bold")[AHMED KHALIL SFAR]
]
#v(-5mm)
#align(center)[
  #show link: set text(rgb("#161695"))
  #text(size: 9.5pt)[
    +216 22 580 908 | #link("mailto:sfarahmed32@gmail.com")[sfarahmed32\@gmail.com] |
    #link("https://portfolio-sand-one-n7ya9be3da.vercel.app")[
      #box(baseline: 20%)[
        #image("assets/globe-solid-full.svg", width: 11pt, height: 11pt)
      ]
      #h(0pt)
      Ahmed Khalil Sfar
    ]
  ]
]
#v(-2.5mm)

#align(center)[
  #show link: set text(rgb("#161695"))
  #text(size: 9.5pt)[
    #link("https://www.linkedin.com/in/ahmed-khalil-sfar-a64778316")[
      #box(baseline: 20%)[
        #image("assets/linkedin-brands-solid-full.svg", width: 11pt, height: 11pt)
      ]
      #h(0pt)
      Ahmed Khalil Sfar
    ]|
    #link("https://github.com/sfeedbackx")[
      #box(baseline: 20%)[
        #image("assets/github-brands-solid-full.svg", width: 11pt, height: 11pt)
      ]
      #h(0pt)
      Ahmed Khalil Sfar
    ]
  ]
]
#v(-2mm)

#align(center)[
  #text(size: 9.5pt)[Tunis, Tunisia]
]
#v(2mm)

// ---------- Objective ----------

#sectionTitle("Objective")
#text(size: 10pt)[
  Computer Science graduate from the Faculty of Sciences of Tunis seeking opportunities to apply
  and expand my knowledge in software engineering and information technology. I am motivated to
  contribute to  projects, and continuously develop my technical and
  professional skills.
]

// ---------- Experience ----------

#sectionTitle("Experience")
#subheading(
  "Nexits",
  "Tunis, Tunisia",
  "Summer Internship → End-of-Studies Internship",
  "May 2025 – June 2026",
)
#v(-1mm)
#list(
  [Progressed from a summer intern to an end-of-studies intern, contributing to the development
    of backend services with NestJS, TypeScript, and PostgreSQL.],
  [Developed the backend of MedLink, designing RESTful APIs and integrating them with a Flutter mobile application.],
  [Implemented automated testing, CI/CD pipelines with GitHub Actions, and deployed applications on AWS using Nginx.],
  [Collaborated with the development team to deliver scalable and secure backend solutions.],
)
#subheading(
  [
    #link("https://www.amenbank.com.tn/")[
      Amen-Bank
      [#box(baseline: 20%)[
        #image("assets/globe-solid-full-blue.svg", width: 11pt, height: 11pt)
      ]]
    ]
  ],
  // I added this vertical margin because i felt  the location is bit  lower then other
  [#v(-1.5mm)Tunis, Tunisia],
  "Summer Internship",
  "July 2024 - August 2024",
)
#list(
  [Developed a banking web application supporting user management, balance consultation, and money transfers.],
  [Implemented two-factor authentication (OTP) and secure user authentication to protect sensitive operations.],
)

// ---------- Projects ----------

#v(2pt)
#sectionTitle("Projects")
#project(
  "AI Project: AI-Powered Email Assistant",
  "Tools: NestJS, React.js, PostgreSQL, Drizzle ORM, Ollama",
  "June 2026",
  link("https://github.com/sfeedbackx/email-gen")[[#box(baseline: 20%)[
      #image("assets/github-brands-solid-full-blue.svg", width: 11pt, height: 11pt)
    ]]
  ],
)
#list(
  [Developed an AI-powered email assistant that generates context-aware drafts using local large language models.],
  [Built a benchmarking framework to compare Qwen2.5, Llama 3.1, and Mistral across realistic email-generation scenarios.],
)
#project(
  "Cybersecurity Project: Development of a Capture The Flag (CTF) Platform",
  "Tools: Node.js, React, Docker, MongoDB, AWS",
  "January 2026",
  link("https://github.com/sfeedbackx/ctf_platform")[[#box(baseline: 20%)[
      #image("assets/github-brands-solid-full-blue.svg", width: 11pt, height: 11pt)
    ]]],
)
#list(
  [Developed a web platform for hosting and solving cybersecurity challenges in isolated environments.],
  [Automated deployment and orchestration of Docker-based challenge instances on cloud infrastructure.],
)

#project(
  "Backend Project: Package Management Application Development",
  "Tools: Spring Boot, MySQL",
  "March 2025",
  link("https://github.com/subomega1/Livrili_backend")[ #stack(
      dir: ltr,
      [\[],
      [#image(
        "assets/github-brands-solid-full-blue.svg",
        width: 11pt,
        height: 11pt,
      )],
      [\]],
    )
  ],
)
#list(
  [Developed a package delivery platform where clients manage shipments and couriers submit delivery offers.],
  [Designed a scalable REST API using Spring Boot with role-based access control and secure data management.],
)

#project(
  "Web Project: Real-Time Chat Application Development",
  "Tools: MongoDB, React.js, Node.js, Socket.io",
  "July 2024",
  link("https://github.com/subomega1/Chat-app")[[#box(baseline: 20%)[
      #image("assets/github-brands-solid-full-blue.svg", width: 11pt, height: 11pt)
    ]]
  ],
)
#list(
  [Built a real-time messaging application with instant communication, online presence, and global state management.],
  [Designed a responsive user interface using TailwindCSS and DaisyUI.],
)

#project(
  "Linux Project: Linux Environment Management and Customization",
  "Tools: Linux, GNU Stow",
  "Present",
  link("https://github.com/subomega1/dotfiles")[[#box(baseline: 20%)[
      #image("assets/github-brands-solid-full-blue.svg", width: 11pt, height: 11pt)
    ]]],
)
#list(
  [Built a portable Linux development environment by managing dotfiles with GNU Stow.],
  [Automated workstation setup through configuration scripts and reproducible system customization.],
)

#pagebreak()
// ---------- Skills ----------
#sectionTitle("skills")
#stack(
  spacing: 3mm,
  dir: ttb,
  [*Programming Languages:* C, C++, Java, Python, Shell, JavaScript, TypeScript],
  [*Web and Mobile Technologies:* Spring Boot, React, Tailwind, NestJS],
  [*Backend Technologies:* Node.js, Express.js, Spring Boot, NestJS],
  [*Database Management Systems:*: PostgreSQL, MySQL, MongoDB],
  [*Testing Technologies:* JUnit, Postman, Swagger],
  [*DevOps \& Version Control Tools:* Git, Docker, Linux],
  [*Other Tools \& Technologies:* GitHub],
)
// ---------- Leadership ----------
#sectionTitle("Leadership Experience")
#project(
  "Material Resource Manager",
  "Free Software Club CLLFST",
  "2024-2026",
  link("https://cllfst.github.io/website/")[[#box(baseline: 20%)[
      #image("assets/globe-solid-full-blue.svg", width: 11pt, height: 11pt)
    ]]],
)
#list(
  [Co-founded the Genesis programming competition and contributed to technical event organization.],
  [Delivered Windows and Linux technical support, troubleshooting software and hardware issues.],
)

// ---------- Certifications ----------

#sectionTitle("Certifications")

#por(
  link(
    "https://learn.nvidia.com/certificates?id=SVub8cAjTM63icFlF_pl6w#",
  )[*Nvidia: Fundamentals of Deep Learning*],
  "November 2025",
)
#por(
  link(
    "https://www.credly.com/badges/b4d53c27-d810-43ee-a3a0-92707a08191e/public_url",
  )[*AWS Academy Graduate: AWS Academy Cloud Foundations*],
  "January 2026",
)
#v(-1mm)
#por(
  link(
    "https://www.credly.com/badges/9c86f94c-1cb7-4afb-b263-5287669d3d34/public_url",
  )[*CCNA: Introduction to Networks*],
  "October 2024",
)
#v(-1mm)
#por(
  link(
    "https://www.credly.com/badges/4bba192a-ef9e-49c7-ba4e-2a58126d262f/public_url",
  )[*Introduction to Cybersecurity*],
  "August 2024",
)
#v(-1mm)
#por(
  link(
    "https://www.credly.com/badges/eb0ef737-3368-419f-a33a-8b5b1cb9b0d8/public_url",
  )[*Introduction to the Threat Landscape 2.0*],
  "May 2024",
)
#v(-1mm)
#por(
  link(
    "https://www.credly.com/badges/db7ff962-1c15-4de0-9a6e-05e5264400dd/public_url",
  )[*Networking Academy: Learn-A-Thon 2025*],
  "February 2024",
)
#v(-1mm)

// ---------- Education ----------

#sectionTitle("Education")

#subheading(
  "Faculty of Sciences of Tunis",
  "Tunis, Tunisia",
  "",
  "2024 - 2026",
)
#v(-5mm)
#list([Bachelor's Degree in Computer Science])
#subheading(
  "Sadiki High School",
  "Tunis, Tunisia",
  "Secondary Education",
  "2019 - 2023",
)
#v(-1mm)
#list([Mathematics Baccalaureate (Fairly Good Mention)])

// ---------- Additional Information ----------

#sectionTitle("Additional Information")

#text(size: 10pt)[
  *Language Skills*: Arabic (native), French (professional), English (professional), German (intermediate)

  *Interests*: Emerging technologies (AI, Cloud, backend engineering), Open-source projects
]

// ---------- References ----------
#sectionTitle("References")
#text(size: 10pt)[References available upon request]
